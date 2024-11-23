import 'dart:async';

base class A{
  void hh(){

  }
}


base class B extends A{

}



abstract class Person {
  String name;
  int age;
  Person(this.name,this.age);
}


mixin dd{

}

class Thj = Person with dd;

//产生流对象
Stream create() async*{
   int k = 0;
   while(k<5) {
     yield k++;
   }
}

//监听流

void view(){
   Stream stream = create().asBroadcastStream();

   print(stream.isBroadcast);
   stream.listen((event) {
     print('遍历流：${event}');
   },onDone:(){
     print('done');
   } );

   StreamController streamController = StreamController();

   stream.listen((event) {
     print('遍历流2：${event}');
   },onDone:(){
     print('2done');
   } );
}


void test(String s){
  StreamController<int> stc = StreamController.broadcast();

  stc.add(1);

  print(stc.stream.isBroadcast);

  stc.stream.listen((event) {
    print('遍历流：${event}');
  });
  stc.stream.listen((event) {
    print('jian2遍历流：${event}');
  });
  stc.add(2);
  stc.add(3);
  print('3333333333333333');


  stc.close();

  // StreamController<int> stc = StreamController<int>.broadcast();
  //
  // // 检查流是否为广播流
  // print(stc.stream.isBroadcast); // 应该输出 true
  //
  // // 第一个监听者
  // stc.stream.listen((event) {
  //   print('第一个监听者：$event');
  // });
  //
  // // 添加事件
  // stc.add(1);
  // stc.add(2);
  // stc.add(3);
  //
  // print('3333333333333333');
  //  Timer(Duration(seconds: 2),(){
  //    stc.add(4);
  //  });
  // // 第二个监听者
  // stc.stream.listen((event) {
  //   print('第二个监听者：$event');
  // });


}