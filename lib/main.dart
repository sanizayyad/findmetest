import 'package:findmetest/Providers/chatsDialogProvider.dart';
import 'package:findmetest/Providers/storiesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/home.dart';
import 'locator.dart';


void main(){
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChatsDialogProvider>(
          create: (BuildContext context) => locator<ChatsDialogProvider>(),
        ),
        ChangeNotifierProvider<StoriesProvider>(
          create: (BuildContext context) => locator<StoriesProvider>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
