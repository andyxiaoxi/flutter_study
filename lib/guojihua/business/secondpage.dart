import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handclick/guojihua/business/three.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('第二个页面：语言：${'hello'.tr}')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('ssssssssssssssssssss=${Get.currentRoute}');
          Get.to(ThreePage());

        },
      ),
    );
  }
}
