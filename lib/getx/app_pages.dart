
import 'package:get/get.dart';
import 'package:handclick/getx/first_page.dart';
import 'package:handclick/getx/fisrtcontroller.dart';
import 'package:handclick/getx/secondcontroller.dart';
import 'package:handclick/getx/sencond_page.dart';

class AppPages{

  static const initial = '/first';

  static final routes=[
    GetPage(name: '/first', page: ()=>FirstPage(),binding: FisrtBiding()),

    GetPage(name: '/second', page: ()=>SecondPage(),binding: SecondBiding()),

  ];
}

class FisrtBiding extends Bindings{
  @override
  void dependencies() {
    Get.put(FirstController());
  }
}

class SecondBiding extends Bindings{
  @override
  void dependencies() {
    Get.put(SecondCtr());
  }

}