import 'package:findmetest/Providers/chatsDialogProvider.dart';
import 'package:findmetest/Providers/storiesProvider.dart';
import 'package:findmetest/Widgets/chatsdialog.dart';
import 'package:findmetest/Widgets/filters.dart';
import 'package:findmetest/Widgets/stories.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    locator<ChatsDialogProvider>().getDialogChats();
    locator<StoriesProvider>().getStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Сообщения",
                  style: TextStyle(
                  fontSize: 24,
                    fontWeight: FontWeight.bold
                ),),
                InkWell(
                  onTap: (){
                    print("not available");
                  },
                  child: Icon(
                    Icons.clear,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Stories(),
          Filters(),
          SizedBox(
            height: 20,
          ),
          ChatsDialog(),
        ],
      )),
    );
  }
}
