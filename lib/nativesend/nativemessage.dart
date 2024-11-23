
import 'package:flutter/services.dart';

class MyPlugin {

  static final  myChannel = MethodChannel('mytestchannel');

  void getDeviceMessage() async{
    var res =  await myChannel.invokeMethod('getInfo',1);
  }


  void init(){
    myChannel.setMethodCallHandler(handleCall);
  }

  Future<void> handleCall(MethodCall call) async {
    if(call.method=='getFlutter'){

    }


  }
}