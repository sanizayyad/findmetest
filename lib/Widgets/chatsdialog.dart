import 'package:findmetest/Models/DialogModel.dart';
import 'package:findmetest/Providers/baseprovider.dart';
import 'package:findmetest/Providers/chatsDialogProvider.dart';
import 'package:findmetest/Widgets/emptyChats.dart';
import 'package:findmetest/Widgets/profileavatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';


class ChatsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatsDialogProvider>(
      builder: (_,dialogProvider,child) =>
      dialogProvider.viewState == ViewState.Busy
          ? LoadingChats()
          : dialogProvider.dialogChats.isEmpty
          ? EmptyChats()
      :Column(
        children: dialogProvider
            .dialogChats
            .map((e) => ChatsListItem(
          dialogChatModel: e,
          unread: dialogProvider.numberOfUnreadMessages(e.messages),
        )).toList(),
      )
      );
  }
}



class ChatsListItem extends StatelessWidget {
  final DialogChatModel dialogChatModel;
  final int unread;
  ChatsListItem({this.dialogChatModel,this.unread});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: (){
          locator<ChatsDialogProvider>().pinChat(dialogChatModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        child: Row(
          children: <Widget>[
            Container(
              child: ProfileAvatar(
                imageUrl: dialogChatModel.userProfile.picture.medium,
                onlineStatus: dialogChatModel.userProfile.onlineStatus,),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "${dialogChatModel.userProfile.name.first}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 5,),
                      dialogChatModel.pinned
                          ? Icon(Icons.bookmark,color: Colors.blueAccent,size: 22,)
                          : Container()
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${dialogChatModel.messages.last.message}",
                    style: TextStyle(
                      color: unread != 0 ? Colors.black : Colors.grey,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "${dialogChatModel.messages.last.messageTime}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      color:  unread != 0 ? Colors.black : Colors.grey
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
              unread != 0
                  ? Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Center(
                      child:  Text(
                        "$unread",
                        style: TextStyle(color: Colors.white),
                      ),
                    ) ,
                  ): Icon(Icons.check,color: Colors.grey,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
