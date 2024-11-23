import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handclick/guojihua/business/firstcontroll.dart';
import 'package:handclick/guojihua/business/secondpage.dart';

class FirstPagae extends StatelessWidget {
  const FirstPagae({super.key}) ;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FirstController());
    return Scaffold(
      body: GetBuilder<FirstController>(builder: (_){
        return Text('');
      }),
    );

    var count  = 1.obs;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Obx(()=>Text('${count.obs.value}')),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(),
        body: GetBuilder(
          init: FirstController(),
          builder: (control){
            return Center(child: Text('第一个个页面：语言：${'hello'.tr}'));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (contex){
              return SecondPage();
            }));
          },
        ),
      ),
    );
  }
}

