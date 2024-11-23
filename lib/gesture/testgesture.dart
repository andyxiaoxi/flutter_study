import 'package:flutter/material.dart';

class TestGesture1 extends StatefulWidget {
  const TestGesture1({super.key});

  @override
  State<TestGesture1> createState() => _TestGestureState();
}

class _TestGestureState extends State<TestGesture1> {
  @override
  Widget build(BuildContext context) {
    return _buildTest();
    return GestureDetector(
       onTap: (){
         print("1");
       },
       child:  const Align(
         child:  ColoredBox(
           color: Colors.blue,
           child: SizedBox.square(dimension: 200,),
         ),
       ),
    );
  }
}


Widget _buildTest(){

   return Directionality(
     textDirection: TextDirection.ltr,
     child: GestureDetector(
       behavior: HitTestBehavior.opaque,
       onTap: (){
          print('dddd');
       },
       child:Align(
         child: Container(

           width: 200,
           height: 200,
           child: Text('这是一段文本',style: TextStyle(color: Colors.blue),),
         ),
       )
     ),
   );
}