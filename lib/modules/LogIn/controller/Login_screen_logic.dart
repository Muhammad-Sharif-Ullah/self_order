import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:self_order/Data/Model/page_route_arguments.dart';
import 'package:self_order/request/api_provider.dart';
import 'package:self_order/shared/Route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../request/routes.dart';

class LoginScreenController extends GetxController {
  ApiProvider api = ApiProvider();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  login(email, password) async {
    final req = http.MultipartRequest('post', Uri.parse(Routes.login));
    req.headers["x-api-key"] = Routes.api_key;
    req.fields['email_id'] = email;
    req.fields['password'] = password;
    var response = await req.send();
    var responded = await http.Response.fromStream(response);
    if (responded.statusCode == 200) {
      var data = jsonDecode(responded.body);
      var profile = data['profile'];
      final SharedPreferences prefs = await _prefs;
      prefs.setString('id', profile['id']);
      prefs.setString('firstname', profile['firstname']);
      prefs.setString('email', profile['email']);
      prefs.setString('profile', profile['profile']);
      prefs.setString('mobile', profile['mobile']);
      prefs.setString('welcome_message', profile['welcome_message']);
      prefs.setString('base_url', profile['base_url']);
      prefs.setString('category', profile['category']);
      prefs.setString('token', profile['token']);

      Navigator.pushNamed(Get.context!, AppRoutes.VideoScreen,
          arguments: PageRouteArguments(
              data: [],
              fromPage: AppRoutes.Login,
              toPage: AppRoutes.VideoScreen));
    }
    return;
  }
}
