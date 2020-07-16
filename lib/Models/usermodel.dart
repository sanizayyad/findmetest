

import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

enum OnlineStatus{Online,Offline}

class ChatUserModel extends Equatable{
  final Name name;
  final Picture picture;
  final OnlineStatus onlineStatus;

  ChatUserModel({
    this.name,
    this.picture,
    this.onlineStatus,
  });

  factory ChatUserModel.fromJson(Map json){
    return ChatUserModel(
        name: Name.fromJson(json['name']),
        picture: Picture.fromJson(json['picture']),
      onlineStatus: Random().nextBool() ? OnlineStatus.Offline : OnlineStatus.Online,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [name, picture,onlineStatus];
}
class Name {
  String title;
  String first;
  String last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }
}
class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }
}