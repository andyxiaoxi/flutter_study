import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handclick/guojihua/message.dart';

class MygetxApp extends StatefulWidget {
  const MygetxApp({super.key});

  @override
  State<MygetxApp> createState() => _MygetxAppState();
}

class _MygetxAppState extends State<MygetxApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('zh','CN'),
      fallbackLocale:Locale('en','US') ,
      home:HomePage()
    );



  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),(){
      setState(() {
        print('更新语言');
        Get.updateLocale(Locale('de','DE'));
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child: Text('hello'.tr),));
  }
}




