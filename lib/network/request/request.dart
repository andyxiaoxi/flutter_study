//请求对象

//1,地址
//2,方法
//3,请求参数(该参数不一定使用)

//4,请求头设置 (这是否可选的参数，在请求对象里面，并不是每个请求对象都需要设置)

// 请求对象，需要指明数据格式字段吗，例如json, pb？？？

//这个是基本类，涉及到具体通信数据格式，我认为是子类的事

// 问，请求体body 对象是什么类型， ------我觉得不一定是map
import 'package:handclick/network/request/http_methond.dart';

abstract class Request {
  late final String url;
  late final HttpMethod method;
  Object? params;
  Map<String, Object>? queryParams;
  Map<String, Object>? headParams;

  Request(
      {required this.url,
      required this.method,
      this.params,
      this.queryParams,
      this.headParams});


}
