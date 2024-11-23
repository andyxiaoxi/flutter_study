
import 'package:dio/src/response.dart' as dio;
import 'package:handclick/network/response/response.dart';

class DefaultResponse<T> extends Response<T>{
  @override
  ParseRawData(dio.Response response) {
    // TODO: implement ParseRawData
    throw UnimplementedError();
  }

}