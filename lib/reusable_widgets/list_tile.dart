import 'package:flutter/material.dart';

class DefaultListTile extends StatelessWidget {
  final String user;
  const DefaultListTile({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[200],
      child: ListTile(
        leading: getIcon(Icons.account_circle),
        title: Text(
          this.user,
          style: TextStyle(
              fontSize: 19.0, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        trailing: getIcon(Icons.done_all),
      ),
    );
  }
}

Widget getIcon(IconData iconData) => Icon(
      iconData,
      color: Colors.white,
      size: 30.0,
    );
