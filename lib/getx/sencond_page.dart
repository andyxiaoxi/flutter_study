import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handclick/getx/secondcontroller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: GetBuilder<SecondCtr>(builder: (ctx){
        return Text('我是第二页');
      },),),
    );
  }
}
