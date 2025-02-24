import 'package:flutter/material.dart';

class MyAnimatedBuilder extends StatefulWidget {
  const MyAnimatedBuilder({super.key});

  @override
  State<MyAnimatedBuilder> createState() => _MyAnimatedBuilderState();
}

class _MyAnimatedBuilderState extends State<MyAnimatedBuilder> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(animation: animation, builder: builder),
    );
  }
}