

import 'package:findmetest/Providers/chatsDialogProvider.dart';
import 'package:findmetest/Providers/storiesProvider.dart';
import 'package:findmetest/Services/api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton<ApiService>(()=>ApiService());

  locator.registerLazySingleton<ChatsDialogProvider>(()=>ChatsDialogProvider());
  locator.registerLazySingleton<StoriesProvider>(()=>StoriesProvider());
}