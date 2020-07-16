import 'dart:math';

import 'package:findmetest/Models/DialogModel.dart';
import 'package:findmetest/Models/usermodel.dart';
import 'package:findmetest/Providers/baseprovider.dart';
import 'package:findmetest/Services/api.dart';
import 'package:findmetest/locator.dart';
import 'package:intl/intl.dart';

enum CurrentFilter{
  All,
  Online,
  Pinned,
}
class ChatsDialogProvider extends BaseProviderModel{
  final ApiService _apiService = locator<ApiService>();


  List<DialogChatModel> allDialogChats = [];
  List<DialogChatModel> dialogChats = [];
  CurrentFilter currentFilter = CurrentFilter.All;

  void sortChats(){
    void sortChatModels(List<DialogChatModel> chatModel){
      DateFormat dateFormat = DateFormat.Hm();
      chatModel?.sort((b,a)=> dateFormat.parse(a.messages.last.messageTime).compareTo(dateFormat.parse(b.messages.last.messageTime)));
    }
    List<DialogChatModel> read = dialogChats.where((a) => a.messages.last.readStatus == ReadStatus.Read).toList();
    List<DialogChatModel> unread =dialogChats.where((a) => a.messages.last.readStatus == ReadStatus.Unread).toList();

    sortChatModels(unread);
    sortChatModels(read);

    dialogChats = read;
    dialogChats.addAll(unread);
  }

  Future<void> getDialogChats() async{
    setViewState(ViewState.Busy);
    List<ChatUserModel> userModels = await _apiService.getRandomUsers();
    userModels.forEach((user) {
      allDialogChats.add(DialogChatModel(
        userProfile: user,
        messages: Message.randomMessages(),
        pinned: Random().nextBool(),
      ));
    });
    dialogChats = allDialogChats;
    allDialogChats.forEach((element) {
      if(element.pinned)
        pinnedChats.add(element);
      if(element.userProfile.onlineStatus == OnlineStatus.Online)
        onlineChats.add(element);
    });
    sortChats();
   setViewState(ViewState.Idle);
  }
  int numberOfUnreadMessages(List<Message> messages){
    int x = messages.where((element) => element.readStatus == ReadStatus.Read).toList().length;
    return x;
  }


  void filterAllUsers(){
    dialogChats = allDialogChats;
    currentFilter = CurrentFilter.All;
    sortChats();
    setViewState(ViewState.Idle);
  }
  void filterSearch(String name){
    setViewState(ViewState.Busy);
    List<DialogChatModel> temp = [];
    allDialogChats.forEach((element) {
      if([element.userProfile.name.first.toLowerCase(), element.userProfile.name.last.toLowerCase()]
          .contains(name.toLowerCase()))
        temp.add(element);
    });
    dialogChats = temp;
    currentFilter = CurrentFilter.All;
    sortChats();
    setViewState(ViewState.Idle);
  }

  List<DialogChatModel> onlineChats = [];
  void filterOnlineUsers(){
    dialogChats = onlineChats;
    currentFilter = CurrentFilter.Online;
    sortChats();
    setViewState(ViewState.Idle);
  }

  List<DialogChatModel> pinnedChats = [];
  void filterPinned(){
    dialogChats = pinnedChats;
    currentFilter = CurrentFilter.Pinned;
    sortChats();
    setViewState(ViewState.Idle);
  }

  void pinChat(DialogChatModel dialogChatModel){
    int index = allDialogChats.indexOf(dialogChatModel);
    if(!allDialogChats[index].pinned){
      allDialogChats[index].pinned = true;
      pinnedChats.add(dialogChatModel);
    }else{
      allDialogChats[index].pinned = false;
      pinnedChats.remove(dialogChatModel);
    }
    setViewState(ViewState.Idle);
  }
}