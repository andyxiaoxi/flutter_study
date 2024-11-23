import 'package:dio/dio.dart';
//该类，提供解析方法
//
abstract class DataParse{
  DataParse parse(Response data);
}