import 'dart:async';

import 'package:flutter/material.dart';

class MyStateWidget extends StatefulWidget {
  const MyStateWidget({super.key});

  @override
  State<MyStateWidget> createState() => _MyStateWidgetState();
}

class _MyStateWidgetState extends State<MyStateWidget> {
  @override
  void initState() {
    print('initState');
    Timer(Duration(seconds: 5),(){
      setState(() {

      });
    });
    super.initState();
  }
  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyStateWidget oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Placeholder();
  }

  @override
  void reassemble() {
    print('reassemble');
    super.reassemble();
  }

  @override
  void activate() {
    print('activate');
    super.activate();
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }
  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }
}
