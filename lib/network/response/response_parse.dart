
//不知道为什么要设计一个  解析响应类的 ？？？？ 脑子懵懵的
import 'package:http/http.dart';
import 'package:dio/dio.dart' as dio;

abstract class ResponseParse{


   //天 啊， 崩塌了，这个原始Response ,http库有，dio 库也有，
   //那请求的结果，到是用http, 还是用dio库的......

   dynamic ParseRawData(dio.Response response);
}