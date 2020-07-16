import 'dart:math';

import 'package:findmetest/Models/usermodel.dart';
import 'package:intl/intl.dart';

class DialogChatModel {
  final ChatUserModel userProfile;
  final List<Message> messages;
  bool pinned;

  DialogChatModel(
      {this.userProfile,
      this.messages,
      this.pinned});
}

enum ReadStatus {Read,Unread}

class Message{
  final String message;
  ReadStatus readStatus;
  final String messageTime;

  Message({this.message,this.readStatus,this.messageTime});


  static List<Message> randomMessages(){
    DateFormat dateFormat = DateFormat.Hm();
    return  List<Message>.generate(10, (index) => Message(
      message: "Hey bruv, How you doing ?",
      readStatus:  Random().nextBool() ? ReadStatus.Unread : ReadStatus.Read,
      messageTime:  dateFormat.format(DateTime.fromMillisecondsSinceEpoch(Random().nextInt(100000000))),
    ),);
  }
}