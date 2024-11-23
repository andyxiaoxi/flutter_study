//响应对象

//原生库的response 对象 已经，含有 方法，状态，状态信息，错误信息， 响应头
//为什么，我们还要设置响应对象？？？？？？？？？？

import 'package:dio/dio.dart' as dio;
import 'package:handclick/network/response/response_parse.dart';

//问： 网络请求错误，还会有错误code ,状态描述信息吗？
//问： 响应对象的协议，各个字段可能不相同，该怎么处理？比如有多个后台
//问： 怎么知道原始响应中的 data 是json ,还是pb,或者是流对象？？
abstract class Response implements ResponseParse {
  //这些变量设置可空，会不会对外面，使用者，用起来不舒服吗
  //为什么使用late关键字,感觉不合理啊
  late final String? code;
  late final String? url;
  late final String? description;

  late final Map<String, dynamic>? headers;
  late final String? error;
  late final Object? data;

  Response(
      {this.code,
      this.url,
      this.description,
      this.headers,
      this.error,
      this.data});

  //命名构造
  Response.create(dio.Response response) {
    code = response.statusCode as String;
    url = response.realUri.toString();
    data = ParseRawData(response.data);
  }
}

//不会写，怎么办， 去迈出第一步，去思考，去想
