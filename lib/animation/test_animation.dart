import 'package:flutter/cupertino.dart';

class TestAnimation extends StatefulWidget {
  const TestAnimation({super.key});
  @override
  State<TestAnimation> createState() => _TestAnimationState();
}

class _TestAnimationState extends State<TestAnimation>
    with TickerProviderStateMixin {
  late AnimationController aniamteController;
  @override
  void initState() {
    super.initState();
    aniamteController = AnimationController(vsync: this);
    aniamteController.addStatusListener((status) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
