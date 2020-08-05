import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final Color color;
  final String title;
  final Function onPressed;

  const DefaultButton({Key key, this.color, this.title, this.onPressed})
      : super(key: key);

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: widget.color ?? Colors.teal,
        onPressed: widget.onPressed,
        child: Text(
          widget.title ?? "Title",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
}
