
import 'package:dio/src/response.dart' as dio;
import 'package:handclick/network/response/response.dart';

///把响应中的data 对象，从map转成对象
class JsonResponse extends Response{

  JsonResponse(dio.Response response):super.create(response);

  @override
  ParseRawData(Object response) {
    // TODO: implement ParseRawData
    throw UnimplementedError();
  }

}