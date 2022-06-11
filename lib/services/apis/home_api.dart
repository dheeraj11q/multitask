import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multitask/data/models/user_model.dart';

class HomeApis {
  Future<UserModel?> userGet({int id = 1}) async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users/$id');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        UserModel user = UserModel.fromJson(data);

        return user;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
