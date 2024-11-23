


import 'package:flutter/material.dart';

class MytestApp extends StatefulWidget {
  const MytestApp({super.key});

  @override
  State<MytestApp> createState() => _MyAppState();
}

class _MyAppState extends State<MytestApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(color: Colors.green,child: SizedBox(width: 80,height: 80),)
      ],
    );
  }
}
