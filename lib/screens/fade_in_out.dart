import 'package:flutter/material.dart';

class FadeInOutAnimation extends StatefulWidget {
  FadeInOutAnimation({Key key}) : super(key: key);

  @override
  _FadeInOutAnimationState createState() => _FadeInOutAnimationState();
}

class _FadeInOutAnimationState extends State<FadeInOutAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    //set animation settings
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1800),
    );

    //set animation value and type
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    //start animation
    _controller.forward();

    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: 200,
            height: 200,
            child: Image.asset("assets/images/bird.png"),
          ),
        ),
      ),
    );
  }
}
