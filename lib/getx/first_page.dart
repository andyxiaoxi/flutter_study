import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handclick/getx/fisrtcontroller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controll = Get.find<FirstController>();
    return Scaffold(
      body: Center(
        child: Obx(() => Text(controll.text.value)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.toNamed('second');
      },

      ),
    );
  }
}
