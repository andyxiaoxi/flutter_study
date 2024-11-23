

import 'package:flutter/material.dart';

class TestLayout extends StatefulWidget {
  const TestLayout({super.key});

  @override
  State<TestLayout> createState() => _TestLayoutState();
}

class _TestLayoutState extends State<TestLayout> {
  @override
  Widget build(BuildContext context) {
    //return  buildFlex();

    return buildConstrainedBox();
  }
}

class buildFlex extends StatelessWidget {
  const buildFlex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(child: ColoredBox(color: Colors.red,),flex: 1,),
          SizedBox.square(dimension: 200,),
        ],
      ),
    );
  }
}

//constrainedBox
Widget  buildConstrainedBox(){
  return Align(child: ConstrainedBox(constraints: BoxConstraints.loose(Size(100,100))));
}