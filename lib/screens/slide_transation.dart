import 'package:flutter/material.dart';

import '../models/users.dart';
import '../reusable_widgets/list_tile.dart';

class SlideTransationAnimation extends StatefulWidget {
  SlideTransationAnimation({Key key}) : super(key: key);

  @override
  _SlideTransationAnimationState createState() =>
      _SlideTransationAnimationState();
}

class _SlideTransationAnimationState extends State<SlideTransationAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _photos;
  Animation<Offset> _users;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1400),
    );

    _photos = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );

    _users = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut));

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
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          photos,
          users,
        ],
      ),
    );
  }

  Widget get photos => SlideTransition(position: _photos,
        child: Container(
          height: 100,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              print("${index + 1}");
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "assets/images/${index + 1}.png",
                  ),
                ),
              );
            },
            itemCount: DummyData.recentUsers.length,
          ),
        ),
      );

  Widget get users => Expanded(child: SlideTransition(
          position: _users,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return DefaultListTile(user: DummyData.users[index]);
            },
            itemCount: DummyData.users.length,
          ),
        ),
      );
}
