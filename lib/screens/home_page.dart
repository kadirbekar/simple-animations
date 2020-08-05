import 'package:flutter/material.dart';
import 'package:simple_animations/screens/repeat_animation.dart';

import '../reusable_widgets/button.dart';
import 'fade_in_out.dart';
import 'slide_transation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const title = "Home Page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          DefaultButton(
            title: "Fade In - Out",
            onPressed: () => goTo(FadeInOutAnimation()),
          ),
          DefaultButton(
            title: "Slide Transition",
            onPressed: () => goTo(SlideTransationAnimation()),
          ),
          DefaultButton(
            title: "Repeatable Animation",
            onPressed: () => goTo(RepeatableAnimation()),
          ),
        ],
      ),
    );
  }

  Widget get appbar => AppBar(
        elevation: 0.0,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(title),
      );

  goTo(Widget page) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }
}
