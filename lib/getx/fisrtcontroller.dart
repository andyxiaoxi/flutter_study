import 'package:get/get.dart';

class FirstController extends GetxController{
  final text = ''.obs;

  @override
  void onInit() {
    super.onInit();
    text.value="我是一段文字";
  }
}