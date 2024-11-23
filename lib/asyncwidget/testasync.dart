import 'dart:async';

import 'package:flutter/material.dart';

class TestAsync extends StatefulWidget {
  const TestAsync({super.key});

  @override
  State<TestAsync> createState() => _TestAsyncState();
}

class _TestAsyncState extends State<TestAsync> {
  late Future<String> future;
  @override
  void initState() {
    future = Future(() async {
      Completer<String> completer = Completer();
      Timer(Duration(seconds: 3), () {
        completer.complete('我是异步任务的');
      });

      return completer.future;
    });

    future = Future(() => throw Exception('dddd'));
    super.initState();

    Timer(Duration(seconds: 10), () {
      setState(() {
        print("主动触发更新");
      });
    });
  }

  @override
  void didUpdateWidget(covariant TestAsync oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('----------------didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            Widget child;
            if (snapshot.hasData) {
              child = Text('${snapshot.data}');
            } else if (snapshot.hasError) {
              child = Text('${snapshot.error}');
            } else {
              child = Text('默认文本');
            }
            return Center(
              child: child,
            );
          },
        ),
      ),
    );
  }
}

class StreambuildeExample extends StatefulWidget {
  const StreambuildeExample({super.key});

  @override
  State<StreambuildeExample> createState() => _StreambuildeExampleState();
}

class _StreambuildeExampleState extends State<StreambuildeExample> {
  Stream stream = create();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
            stream: stream, builder: (ctx, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return Center(child:Text('${snapshot.data}'));
              }
              return Center(child:Text('默认文本'));
        }),
      ),
    );
  }

  static Stream create() async* {
    yield 1;
    yield 2;

    await Future.delayed(Duration(seconds: 3));
    yield 10;
  }
}
