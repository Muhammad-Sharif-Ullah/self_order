import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:self_order/modules/LogIn/ui/Login_screen.dart';
import 'package:self_order/request/dialog.dart';
import 'package:self_order/request/routes.dart';
import 'package:self_order/request/session.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'api_exception.dart';

class ApiProvider {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Accept": "application/json",
        'Authorization': '${await Session.getToken()}',
        'x-api-key': Routes.api_key
      });
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': '${await Session.getToken()}',
          'x-api-key': Routes.api_key
        },
        body: dynamic,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> patch(String url, id, dynamic) async {
    print(dynamic);
    var responseJson;
    try {
      final response = await http.patch(
        Uri.parse(url + '/' + id),
        headers: {
          "Accept": "application/json",
          'Authorization': '${await Session.getToken()}',
          'x-api-key': Routes.api_key
        },
        body: dynamic,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, id) async {
    var responseJson;
    try {
      final response = await http.delete(Uri.parse(url + '/' + id), headers: {
        "Accept": "application/json",
        'Authorization': '${await Session.getToken()}',
        'x-api-key': Routes.api_key
      });
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> show(String url, id) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url + '/' + '$id'), headers: {
        "Accept": "application/json",
        'Authorization': '${await Session.getToken()}',
        'x-api-key': Routes.api_key
      });
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        Get.to(LoginScreen());
        return CustomWidgets.showErrorSnachbar(
            "UNAUTHORISED", "You are not allowed to do this");
        throw UnauthorisedException(response.body.toString());
      case 403:
        return CustomWidgets.showErrorSnachbar(
            "UNAUTHORISED", "You are not allowed to do this");
        throw UnauthorisedException(response.body.toString());
      case 500:
        print('500 error');
        return CustomWidgets.showErrorSnachbar(
            "SERVER ERROR", "PLEASE TRY AGAIN LATER");
      case 422:
        var responseJson = json.decode(response.body);
        return responseJson;
      default:
        print('default ${response.body}');
        return CustomWidgets.showErrorSnachbar(
            "NETWORK ERROR", "PLEASE CHECK YOUR INTERNET CONNECTION");
    }
  }
}
