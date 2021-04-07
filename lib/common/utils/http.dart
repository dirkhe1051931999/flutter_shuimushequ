import 'dart:async';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/utils/authentication.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/global.dart';

/*
  * http 操作类
  *
  * 手册
  * https://github.com/flutterchina/dio/blob/master/README-ZH.md#formdata
  *
  * 从2.1.x升级到 3.x
  * https://github.com/flutterchina/dio/blob/master/migration_to_3.0.md
*/
class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  Dio dio;
  CancelToken cancelToken = new CancelToken();

  HttpUtil._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = new BaseOptions(
      // 请求基地址,可以包含子路径
      baseUrl: SERVER_API_URL,

      // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,

      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,

      // Http请求头.
      headers: {},

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: 'application/json; charset=utf-8',

      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      ///
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      ///
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );

    dio = new Dio(options);

    // Cookie管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          if (options.method.toLowerCase() == 'get') {
            options.path += "?t=${DateTime.now().millisecondsSinceEpoch}";
          }
          return options; //continue
        },
        onResponse: (Response response) {
          if (response.data['code'] == 2) {
            toastInfo(msg: '权限不足');
            throw ('error');
          }
          return response; // continue
        },
        onError: (DioError e) {
          return createErrorMessage('-1');
        },
      ),
    );

    // 加内存缓存和磁盘缓存
    dio.interceptors.add(NetCache());
    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease && PROXY_ENABLE) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY $PROXY_IP:$PROXY_PORT";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  /*
   * error统一处理
   */
  // 错误信息
  String createErrorMessage(String errorcode) {
    dynamic error = {
      "2": '无权限',
      "-1": '网络异常',
    };
    return error[errorcode] ?? '网络异常';
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /// 读取本地配置
  Map<String, dynamic> getAuthorizationHeader() {
    Map<String, dynamic> headers;
    int now = DateTime.now().millisecondsSinceEpoch;
    int signTime = Global.profile['sign-time'];
    // 8280000ms=>23小时
    // deleteAuthentication();
    if (now > (signTime + 8280000)) {
      // 29天cookie 过期
      deleteAuthentication();
    }
    String kbsKey = Global.profile['kbs-key'];
    String kbsInfo = Global.profile['kbs-info'];
    String setIdentity = Global.profile['set_identity'];
    if (setIdentity != null && kbsKey != null && kbsInfo != null) {
      headers = {
        'Authorization': 'Basic Og==',
        "cookie":
            "kbs-key=$kbsKey; kbs-info=$kbsInfo;set_identity=${Uri.encodeFull(setIdentity)}",
      };
    }
    return headers;
  }

  /// restful get 操作
  /// refresh 是否下拉刷新 默认 false
  /// noCache 是否不缓存 默认 true
  /// list 是否列表 默认 false
  /// cacheKey 缓存key
  Future get(
    String path, {
    @required BuildContext context,
    Map<String, dynamic> params,
    Options options,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    bool list = false,
    String cacheKey,
    bool cacheDisk = false,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions = requestOptions.merge(extra: {
        "context": context,
        "refresh": refresh,
        "noCache": noCache,
        "list": list,
        "cacheKey": cacheKey,
        "cacheDisk": cacheDisk,
      });

      Map<String, dynamic> _authorization = getAuthorizationHeader();
      if (_authorization != null) {
        requestOptions = requestOptions.merge(headers: _authorization);
      }
      var response = await dio.get(
        path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e) {
      toastInfo(msg: e.message);
    }
  }

  /// restful post 操作
  Future post(
    String path, {
    @required BuildContext context,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    bool list = false,
    String cacheKey,
    bool cacheDisk = false,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions = requestOptions.merge(extra: {
        "context": context,
        "refresh": refresh,
        "noCache": noCache,
        "list": list,
        "cacheKey": cacheKey,
        "cacheDisk": cacheDisk,
      });
      Map<String, dynamic> _authorization = getAuthorizationHeader();
      if (_authorization != null) {
        requestOptions = requestOptions.merge(headers: _authorization);
      }
      FormData data = FormData.fromMap(params);
      var response = await dio.post(
        path,
        data: data,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return {
        "data": response.data,
        "headers": response.headers,
      };
    } on DioError catch (e) {
      throw createErrorMessage('-1');
    }
  }

  /// restful put 操作
  Future put(
    String path, {
    @required BuildContext context,
    dynamic params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions = requestOptions.merge(extra: {
        "context": context,
      });
      Map<String, dynamic> _authorization = getAuthorizationHeader();
      if (_authorization != null) {
        requestOptions = requestOptions.merge(headers: _authorization);
      }
      var response = await dio.put(path,
          data: params, options: requestOptions, cancelToken: cancelToken);
      return (response.data);
    } on DioError catch (e) {
      throw createErrorMessage('-1');
    }
  }

  /// restful patch 操作
  Future patch(
    String path, {
    @required BuildContext context,
    dynamic params,
    Options options,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions = requestOptions.merge(extra: {
        "context": context,
      });
      Map<String, dynamic> _authorization = getAuthorizationHeader();
      if (_authorization != null) {
        requestOptions = requestOptions.merge(headers: _authorization);
      }
      var response = await dio.patch(path,
          data: params, options: requestOptions, cancelToken: cancelToken);
      return (response.data);
    } on DioError catch (e) {
      throw createErrorMessage('-1');
    }
  }

  /// restful delete 操作
  Future delete(
    String path, {
    @required BuildContext context,
    dynamic params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions = requestOptions.merge(extra: {
        "context": context,
      });
      Map<String, dynamic> _authorization = getAuthorizationHeader();
      if (_authorization != null) {
        requestOptions = requestOptions.merge(headers: _authorization);
      }
      var response = await dio.delete(path,
          data: params, options: requestOptions, cancelToken: cancelToken);
      return (response.data);
    } on DioError catch (e) {
      throw createErrorMessage('-1');
    }
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    @required BuildContext context,
    dynamic params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions = requestOptions.merge(extra: {
        "context": context,
      });
      Map<String, dynamic> _authorization = getAuthorizationHeader();
      if (_authorization != null) {
        requestOptions = requestOptions.merge(headers: _authorization);
      }
      var response = await dio.post(path,
          data: FormData.fromMap(params),
          options: requestOptions,
          cancelToken: cancelToken);
      return (response.data);
    } on DioError catch (e) {
      throw createErrorMessage('-1');
    }
  }
}
