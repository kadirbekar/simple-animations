import 'package:flutter/material.dart';

class RepeatableAnimation extends StatefulWidget {
  RepeatableAnimation({Key key}) : super(key: key);

  @override
  _RepeatableAnimationState createState() => _RepeatableAnimationState();
}

class _RepeatableAnimationState extends State<RepeatableAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3500),
    );

    _animation = Tween<double>(begin: 0, end: 5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
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
        child: animation,
      ),
    );
  }

  Widget get animation => Transform.rotate(
        angle: _animation.value,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/dart.png"),
            ),
          ),
        ),
      );
}
