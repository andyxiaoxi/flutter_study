import 'dart:async';

import 'package:flutter/material.dart';

class MyinheritedWidget extends InheritedWidget{
  MyinheritedWidget({required super.child});

  final int data = 1;

  @override
  bool updateShouldNotify(covariant MyinheritedWidget oldWidget) {
     return data != oldWidget.data;
  }

}


class TestInherited extends StatefulWidget {
  const TestInherited({super.key});

  @override
  State<TestInherited> createState() => _TestInheritedState();
}

class _TestInheritedState extends State<TestInherited> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
      setState(() {
        print('更新');
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MyinheritedWidget(child: ColoredBox(
      color: Colors.red,
    ));
  }
}

class GetData extends StatelessWidget {
  const GetData({super.key});

  @override
  Widget build(BuildContext context) {
    //获取inherited的数据
    var data = context.dependOnInheritedWidgetOfExactType<MyinheritedWidget>();
    return SizedBox.square(dimension: 200,child:
      Text('$data'),);
  }
}
