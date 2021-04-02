# flutter 版水木社区

### 进度

##### 2021-03-24

1. 完成项目架构搭建，dio 封装，fluro 路由，provider 状态管理，cache 和代理
2. 完成首页，top 10

<!-- ![](https://p26-tt.byteimg.com/origin/pgc-image/470609f0402e4ef880d898dd2b84f1dc) -->
<!-- ![](https://p3-tt-ipv6.byteimg.com/origin/pgc-image/086167e9864f417aa753710d799e3ff1) -->

##### 2021-03-25

1. 完成讨论区
2. 完成个人主页

<!-- ![](https://p1-tt-ipv6.byteimg.com/origin/pgc-image/589d63e5ade74508966b6f4d62971365) -->
<!-- ![](https://p6-tt-ipv6.byteimg.com/origin/pgc-image/f6da78c7eab94390826e9db82ec217cc) -->

##### 2021-03-27

1. 完成搜索页及其交互和联调，完成首页吸顶的效果<br/>
   <!-- ![](https://p26-tt.byteimg.com/origin/pgc-image/311053162fdc43d7b3f46c07f1c97af3) -->
   <!-- ![](https://p1-tt-ipv6.byteimg.com/origin/pgc-image/88146800da79457e83b911164016794a) -->
2. 完成登录页及其交互和联调<br/>
   <!-- ![](https://p26-tt.byteimg.com/origin/pgc-image/2198157744714defa7da9a7cbdd227c9) -->
   <!-- ![](https://p26-tt.byteimg.com/origin/pgc-image/90e03b855e894656866fa761c66c6ad5) -->
3. 完成权限校验的交互和联调<br/>
   <!-- ![](https://p26-tt.byteimg.com/origin/pgc-image/0d3f55f49a8c4feebd71e49a2a1b1858) -->
4. 完成首页的图览 tab<br/>
   <!-- ![](https://p1-tt-ipv6.byteimg.com/origin/pgc-image/961f188692f54333a01c313c3cfb55f5) -->
5. 完成首页文字模式和图片模式的切换<br/>
   <!-- ![](https://p26-tt.byteimg.com/origin/pgc-image/227e2b6f8b3e48aeb64980a0035bff37) -->
   <!-- ![](https://p26-tt.byteimg.com/origin/pgc-image/0d3f55f49a8c4feebd71e49a2a1b1858) -->
6. 完成并封装了图片点击放大预览功能<br/>
   <!-- ![](https://p3-tt-ipv6.byteimg.com/origin/pgc-image/dcd2496a62e9433cb06a046f76039bff) -->
7. 个人中心需要再登陆情况下才能进入，首页，top10，讨论区，搜索页不需要登陆校验
8. 登陆情况下访问需要 token 的接口，可正常访问，否则是 403

##### 2021-03-29

1. 封装了详情页的滚动吸顶，和评论输入框 fixed 底部并在 focus 的时候紧贴 keyboard

##### 2021-03-30

1. 完成详情页的文章详情
2. 增加了首页 tab fixed 头部
3. 增加了首页的下拉刷新和上拉加载

##### 2021-03-31

1. 完成详情页的 like 和 comment

##### 2021-04-01

1. 完成了打包构建配置
2. 完成了个人中心的 customscroll
3. 完成了评论中的更多
4. 优化了详情页因多次 build 卡顿的问题
