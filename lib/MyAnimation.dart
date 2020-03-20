import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  final Widget child;
  MyAnimation({@required this.child});
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  @override
  void initState(){
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 3.0).animate(_controller),
        child: widget.child,
    );
  }
}
