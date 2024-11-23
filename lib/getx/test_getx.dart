import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handclick/getx/app_pages.dart';

class TestGetx extends StatefulWidget {
  const TestGetx({super.key});

  @override
  State<TestGetx> createState() => _TestGetxState();
}

class _TestGetxState extends State<TestGetx> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}



