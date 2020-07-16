import 'package:flutter/material.dart';


class LoadingChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Center(child: CircularProgressIndicator()));
  }
}


class EmptyChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.height*0.4,
              child: Image.asset("images/notif.png"),
            ),
            SizedBox(height: 10,),
            Text("No Chats!", style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),)
          ],
        ));
  }
}
