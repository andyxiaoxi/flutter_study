import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:handclick/network/const/data_type.dart';
import 'package:handclick/network/handle/network_state_handle.dart';
import 'package:handclick/network/handle/token_handle.dart';
import 'package:handclick/network/http.dart';
import 'package:handclick/network/http_config.dart';
import 'package:handclick/network/request/http_methond.dart';
import 'package:handclick/network/request/request.dart';
import 'package:handclick/network/request/request_json.dart';
import 'package:handclick/network/response/data_parse.dart';
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


//网络框架中的ui层
//怎么关联这些， 或者引入这些ui的东西 ，能把算到  具体业务里吗？
//思考： 如果增加新的业务， 继承父类，扩展
//可是我们的业务，和具体的 某个库，某个协议无关， 因此，是不是需要设计一些类，去管理？

// 我的想法是，把无网处理，token处理，抽取公共？？
// 请问我这种方式可行吗？
// 讨论： 抽取方式的可行性
// 抽取的特点
// 1,共性
// 2,父子，兄弟
// 3,在使用他们的最高抽想层，使用都是他们的共有
// 从上面的特点出发，token 业务和无网业务，没有共性
// 因为需要设计不同的类处理

//新问题：问究竟设一个类处理，还是方法来处理，这些业务？？？
//分析： 1,方法 2,类
//      唯一场景，假设改动时
//      方法:一定需要改动
//        类：可以通过子类，这种方式改动
//结论： 那还是设计类，比较好



class DioClient extends HttpClient {
  DioClient(super.httpConfig,{this.tokenHandle,this.netWorkStateHandle});

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

  //---------------------------
  // 下面是一些业务处理类字段
  // 假设如果要增加新的业务，又该怎么处理呢
  // 1,修改当前类，增加字段（好像违背了solid原则）
  // 2,子类继承该类，增加业务字段
  // 字段访问限制性
  // 问题： 1,这些业务字段，需要被外部访问吗？（刚觉，应该私有，外部访问，干嘛？？）
  //       2,但是如果设计为私有变量，外部继承，能修改吗？
  // 字段的赋值，在哪些地方赋值
  // 1,构造方法
  // 2,创建dioclient 对象，外部赋值也行，（好处：可以动态改变业务处理对象）
  //--------------------------
  TokenHandle? tokenHandle;
  NetWorkStateHandle? netWorkStateHandle;


  // 我定义泛型Response<T>, 但是类里面没有使用它，（这里就存在设计问题）
  //
  @override
  Future<custom.Response<T>> send<T extends DataParse> (Request request) async{
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
        return DefaultResponse();
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

    //响应对象的，采用什么格式，去解析成对应的具体类型
    //1,外部已经告知当前返回对象类型
    //2,内部运行检测当前是什么类型


    //思考： 我们发送请求，应该是已经告知服务器，当前采用什么数据格式，（请求头配置，数据格式字段），要不然服务器，不知道，
    //怎么解析数据
    //由上面推断：
    //其实我们在这里已经知道服务器的数据格式（可能有误，建设客户端传的json请求，但是服务器返回的是pb响应，所以这里存疑）

    //总结：此时，我们已经知道，具体返回的数据类型（部分对，如同上面的括号里说明）

    //那么下面的代码就有问题，不能根据请求对象的类型，去觉得服务器返回的是什么格式数据(但是通常可以这么做)
    //if(request.runtimeType is JsonRequest){
    // var jsonResult = JsonResponse(response).ParseRawData(response.data);
    //}

    //新问题：业务对象，能设计即支持pb，也能支持json,(我觉得可以，因为java可以)
    //看了chatgpt的回答，会有2个类，这2个类字段相同，一个类是pb生成的dart类，一个类是含有 转二进制数据
    //转换成pb的方法


    //重大问题， 这里需要创建泛型对象，T var = T(), 思路有问题啊，为啥会卡在这里啊 ★★
    if(dataType==DataType.json){
      //json
       jsonDecode(response.data);
    }else{
      //pb
    }

    return DefaultResponse();
  }

  ///测试字段，记录当前传输格式
  DataType dataType= DataType.json;


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

