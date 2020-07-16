
import 'package:findmetest/Models/usermodel.dart';
import 'package:findmetest/Providers/baseprovider.dart';
import 'package:findmetest/Services/api.dart';

import '../locator.dart';

class StoriesProvider extends BaseProviderModel{
  final ApiService _apiService = locator<ApiService>();

  List<ChatUserModel> stories = [];

  Future<void> getStories() async{
    setViewState(ViewState.Busy);
    stories = await _apiService.getRandomUsers();
    setViewState(ViewState.Idle);
  }
}