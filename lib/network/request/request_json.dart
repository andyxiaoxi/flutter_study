import 'package:dio/dio.dart';
import 'package:handclick/network/request/request.dart';

// json 请求对象，是针对他的请求体
abstract class JsonRequest<T> extends Request {
  //问，为什么查询对象不设置 类的方式，而设置成map???
  //T 任意一个，数据模型
  final T data;
  JsonRequest(
      {required super.url,
      required super.method,
      required this.data,
      super.queryParams,
      super.headParams}) {
    //查询参数，可能为空，

    //post 请求体，要转json
    super.params = toJson();
  }

  //1，任意请求体对象(数据)转json,交个具体的类，去实现
  Map<String, Object>? toJson();

  void fromJson() {}
}
