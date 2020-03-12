import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData icon;

  const CenteredMessage({Key key, @required this.message,@required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 40, color: Colors.white70,),
            Text(message, style: TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white70
            ),),
          ],
        ),
      ),
    );
  }
}