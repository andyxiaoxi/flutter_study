
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TestGesture extends StatefulWidget {
  const TestGesture({super.key});

  @override
  State<TestGesture> createState() => _TestGestureState();
}

class _TestGestureState extends State<TestGesture> {
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
            child: Container(
              width: 200,
              height: 200,
               color: Colors.red,
              child: Text("测试"),
            ),
            onTap: (){
              print("xxxx");
            },
            onDoubleTapDown: (d){
              print("onDoubleTapDown");
            },
            onTapDown: (d){
              print("onTapDown");
            },
      ),
    );
  }
}
