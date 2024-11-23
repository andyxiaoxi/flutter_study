//http配置类

//这个配置类，需要配置那些信息？？？
//我不知道啊
//1,是否http 还是https请求
//

import 'package:dio/dio.dart';
import 'package:handclick/network/dio_client.dart';

//这里放的是dio的配置，这样设置，不就是面向具体编程了吗？？？

//思考：这里先用来配置啥，超时时间等
class HttpConfig{
  //拦截器
  //Interceptors interceptors=Interceptors();
  int sendTimeout=2000;
  int reciveTimeout = 2000;
  int connectTimeout = 2000;

  bool isHttps = false;

  //请求地址的url是否需要放置这里，  感觉不需要，这样容易写死，不灵活
}