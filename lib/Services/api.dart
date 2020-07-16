import 'package:findmetest/Models/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class ApiService{
  static const String _api  = "https://randomuser.me/api/?inc=name,picture,&results=100";

  Future<List<ChatUserModel>> getRandomUsers() async {
    List<ChatUserModel> userModels = [];
    var response = await http.get(_api);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      if (decode['results'] != null) {
        decode["results"].forEach((element) {
          userModels.add(ChatUserModel.fromJson(element));
        });
      }
      return userModels;
    }
    return [];
  }

}