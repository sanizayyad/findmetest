import 'package:findmetest/Models/usermodel.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final OnlineStatus onlineStatus;
  ProfileAvatar({this.imageUrl,this.onlineStatus = OnlineStatus.Offline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill),
                borderRadius: BorderRadius.all(Radius.circular(35)),
                color: Colors.black),
        ),
        onlineStatus == OnlineStatus.Online
            ? Positioned(
            top: 1,
            right: -4,
            child: CircleAvatar(
                radius: 11,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 7,
                )))
            :Container()
      ],
    );
  }
}
