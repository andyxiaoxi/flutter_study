import 'package:dio/dio.dart';
import 'package:handclick/network/http.dart';
import 'package:handclick/network/http_config.dart';
import 'package:handclick/network/request/http_methond.dart';
import 'package:handclick/network/request/request.dart';
import 'package:handclick/network/request/request_json.dart';
import 'package:handclick/network/response/deafult_response.dart';
import 'package:handclick/network/response/response.dart' as custom;
import 'package:handclick/network/response/response_json.dart';

//这个http配置对象， 需要被解析，然后去设置，底层网络库的配置信息
//1,那么这个方法 应该设计在那个类里面??
//2,这个配置对象，可以动态修改，因为每个请求可能不一样
//3,但是有的请求又是同一个配置对象啊
//4,有的配置对象被修改了，就一直处于修改的状态中


//思考：感觉，还需要提供一个类，维护一个单例httpclient对象，这样同样的网络请求，采用同一个配置

//当是一个特别的网络请求，需要创建一个新的httpClient对象

//这些拦截器和https,请求头参数，是否统一放到配置头里面
class DioClient extends HttpClient {
  DioClient(super.httpConfig);

  Dio? _dio;

  void init() {
    _dio = Dio();

    //设置http配置
    setHttpConfig();
  }

  void setHttpConfig(){
    //设置拦截器
    setInterceptors();
    //设置https
    //其他设置，比如请求头,超时啥的，请求地址

  }



  @override
  Future<custom.Response<T>> send<T> (Request request) async{
    //没有dio 创建dio,并初始化配置
    if(_dio==null){
      init();
    }

    //第二步，取出request对象，进行配置
    String url = request.url;
    HttpMethod method = request.method;

    _dio!.options.baseUrl=url;
    Response response;
    //第三步请求

    //一些难点业务
    //请求无网处理
    //请求token过期，某个业务处理
    //如果多个网路请求过期，
    //怎么取消网络请求呢


    // 是不是增加一个 网络ui层的东西？？？？？？？？
    if(checkNetWorker!=null){
      //每次发送，检测网络是否有网
      bool result = checkNetWorker!();
      if(!result){
        //无网，构造一个无网的响应对象
        //需要把这个无网的响应对象，返回出去吗？
        //增加ui提示
        return  DefaultResponse();
      }
    }

    switch(method){
      case HttpMethod.get:
        response = await _dio!.get(url);
        break;
      case HttpMethod.post:
        response = await _dio!.get(url);
        break;
      case HttpMethod.put:
        response = await _dio!.get(url);
        break;
    }

    //第四步，响应对象处理

    //不同数据格式的请求
    if(request.runtimeType is JsonRequest){

      var jsonResult = JsonResponse(response).ParseRawData(response.data);
    }
  }

  @override
  void download() {}

  @override
  void upload() {}

  //--------------------------------------------------
  //dio库特有的配置

  //拦截器list变量
  Interceptors interceptors=Interceptors();

  //给dio设置
  void setInterceptors(){
    if(_dio==null) return;
    for(Interceptor e in interceptors){
      _dio!.interceptors.add(e);
    }
  }

  //新增一个拦截器
  void addInterceptor(Interceptor i){
    if(_dio==null) return;
    _dio!.interceptors.add(i);
  }

  //设置是否启用https
  void setEnableHttps(){

  }

  //其他设置
  void setOther(){

  }

  //支持动态修改httpconfig的参数

  //设置请求头
  void setHeader(){

  }

  //设置请求url
  void setUrl(){

  }

  //新增业务
  //----------------------------------
  //检测网络的方法
  CheckNetWorker? checkNetWorker;

  //具体业务处理，例如token过期，
  //还有，对于单独网络请求，又该怎么和所有的网络请求，统一呢

}
//检测网络的方法， 交给使用者，检测
typedef CheckNetWorker = bool Function();

