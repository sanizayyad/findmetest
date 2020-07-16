import 'package:flutter/material.dart';

class EmptyChatsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('images/notif.png'))),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "No Messages!",
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}
