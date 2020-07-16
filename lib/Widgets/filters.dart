import 'package:findmetest/Providers/chatsDialogProvider.dart';
import 'package:findmetest/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatsDialogProvider>(
        builder: (_,dialogProvider,child)=> Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          SearchBar(),
          SizedBox(height: 8,),
          OnlineUsers(dialogProvider: dialogProvider,),
          SizedBox(height: 8,),
          PinnedUsers(dialogProvider: dialogProvider,)
        ],
      ),
    ));
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _nameController = TextEditingController();

  final getData = locator<ChatsDialogProvider>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color:Colors.grey.withOpacity(getData.currentFilter == CurrentFilter.All ? 0.5 : 0.2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      onChanged: (var x){
                        setState(() {
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: "All users",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      _nameController.clear();
                      getData.filterAllUsers();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IgnorePointer(
          ignoring: _nameController.text.isEmpty,
          child: Opacity(
              opacity: _nameController.text.isEmpty ? 0.4 : 1,
            child: InkWell(
              onTap: (){
                getData.filterSearch(_nameController.text.trim());
              },
              child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Icon(Icons.search),
                  )),
            ),
          )
        )
      ],
    );
  }
}

class OnlineUsers extends StatelessWidget {
  final ChatsDialogProvider dialogProvider;
  OnlineUsers({this.dialogProvider});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        dialogProvider.filterOnlineUsers();
      },
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color:Colors.grey.withOpacity(dialogProvider.currentFilter == CurrentFilter.Online ? 0.5 : 0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: "Online",
                    icon: Icon(Icons.settings_input_antenna),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Center(
                    child: Text(
                      "${dialogProvider.onlineChats.length}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
class PinnedUsers extends StatelessWidget {
  final ChatsDialogProvider dialogProvider;
  PinnedUsers({this.dialogProvider});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       dialogProvider.filterPinned();
      },
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.withOpacity(dialogProvider.currentFilter == CurrentFilter.Pinned ? 0.5 : 0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: "Pinned",
                    icon: Icon(Icons.bookmark_border),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Center(
                    child: Text(
                        "${dialogProvider.pinnedChats.length}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
