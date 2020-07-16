
import 'package:findmetest/Models/usermodel.dart';
import 'package:findmetest/Providers/baseprovider.dart';
import 'package:findmetest/Providers/storiesProvider.dart';
import 'package:findmetest/Widgets/profileavatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StoriesProvider>(
      builder: (_,storyProvider,child)=> storyProvider.viewState == ViewState.Busy
          ? Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: CircularProgressIndicator(),
            ),
          )
          : Container(
              height: 130,
              margin: EdgeInsets.only(bottom: 5),
              width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: storyProvider.stories.map((e) => StoryItem(e)).toList(),
              )
          ),
    );



  }
}

class StoryItem extends StatelessWidget {
  final ChatUserModel chatUserModel;
  StoryItem(this.chatUserModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              ProfileAvatar(
                imageUrl: chatUserModel.picture.medium,
                onlineStatus: chatUserModel.onlineStatus,),
              Positioned(
                  bottom: -10,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "67%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(height: 16,),
          Container(
            width: 70,
            child: Text(
              "${chatUserModel.name.first}",
              style: TextStyle(
                fontSize: 15,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
