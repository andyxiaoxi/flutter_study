import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({super.key});

  @override
  State<ThreePage> createState() => _SecondPageState();
}

class _SecondPageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('第三：语言：${'hello'.tr}')),
      floatingActionButton: FloatingActionButton(
        child: Text('更改语言'),
        onPressed: (){
          print('${Get.currentRoute}');
          Get.updateLocale(Locale('de','DE'));
        },
      ),
    );
  }
}
