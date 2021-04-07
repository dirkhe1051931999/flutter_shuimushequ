import 'package:intl/intl.dart';

/// 格式化时间
String duTimeLineFormat(DateTime dt) {
  final num oneMinute = 60000;
  final num oneHour = 3600000;
  final num oneDay = 86400000;
  final num oneWeek = 604800000;

  final String oneSecondAgo = " 秒前";
  final String oneMinuteAgo = " 分钟前";
  final String oneHourAgo = " 小时前";
  final String oneDayAgo = " 天前";
  final String oneMonthAgo = " 月前";
  final String oneYearAgo = " 年前";

  num toSeconds(num date) {
    return date / 1000;
  }

  num toMinutes(num date) {
    return toSeconds(date) / 60;
  }

  num toHours(num date) {
    return toMinutes(date) / 60;
  }

  num toDays(num date) {
    return toHours(date) / 24;
  }

  num toMonths(num date) {
    return toDays(date) / 30;
  }

  num toYears(num date) {
    return toMonths(date) / 365;
  }

  num delta = DateTime.now().millisecondsSinceEpoch - dt.millisecondsSinceEpoch;
  if (delta < 1 * oneMinute) {
    num seconds = toSeconds(delta);
    return (seconds <= 0 ? 1 : seconds).toInt().toString() + oneSecondAgo;
  }
  if (delta < 45 * oneMinute) {
    num minutes = toMinutes(delta);
    return (minutes <= 0 ? 1 : minutes).toInt().toString() + oneMinuteAgo;
  }
  if (delta < 24 * oneHour) {
    num hours = toHours(delta);
    return (hours <= 0 ? 1 : hours).toInt().toString() + oneHourAgo;
  }
  if (delta < 48 * oneHour) {
    return "昨天";
  }
  if (delta < 30 * oneDay) {
    num days = toDays(delta);
    return (days <= 0 ? 1 : days).toInt().toString() + oneDayAgo;
  }
  if (delta < 12 * 4 * oneWeek) {
    num months = toMonths(delta);
    return (months <= 0 ? 1 : months).toInt().toString() + oneMonthAgo;
  } else {
    num years = toYears(delta);
    return (years <= 0 ? 1 : years).toInt().toString() + oneYearAgo;
  }
}

String duTimeLineFormat2(DateTime dt) {
  final dtFormat = new DateFormat('hh:mm:ss');
  var str = dtFormat.format(dt);
  return str;
}

String duTimeLineFormat3(DateTime dt) {
  final dtFormat = new DateFormat('yyyy-MM-dd hh:mm:ss');
  var str = dtFormat.format(dt);
  return str;
}
