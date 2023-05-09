import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:post_data/model/user_model.dart';
import 'package:http/http.dart' as http;

class Controller {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  bool isLOading = false;
  UserModel? usermodel;
  Future<UserModel> postUserTap(context) async {
    isLOading = true;
    if (!Form.of(context).validate()) {
      isLOading = false;
      // return;
    }
    Uri url = Uri.parse("https://reqres.in/api/users");

    http.Response response = await http.post(url,
        body: {"name": nameController.text, "job": jobController.text});

    var json = jsonDecode(response.body);
    usermodel = UserModel.fromJson(json);
    return usermodel!;

    // return usermodel!;
  }
}
