import 'dart:convert';

import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/auth/login_request.dart';
import 'package:grocery_nepal/data/models/auth/login_response.dart';
import 'package:grocery_nepal/data/models/auth/register_request.dart';
import 'package:http/http.dart' as http;

import '../../app_controller.dart';

class AuthApi {
  static Future<LoginResponse> login(
      {required String username, required String password}) async {
    final url = baseUrl + "users/login/";
    final request = jsonEncode(
        LoginRequest(username: username, password: password).toJson());
    final response = await http.post(
      Uri.parse(url),
      body: request,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      await Get.find<AppController>()
          .sharedPreference
          .setString('token', loginResponse.token ?? '');
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception("Invalid Credentials");
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<LoginResponse> register(
      {required String name,
      required String email,
      required String password}) async {
    final url = baseUrl + "users/register/";
    final request = jsonEncode(
        RegisterRequest(name: name, email: email, password: password).toJson());
    final response = await http.post(
      Uri.parse(url),
      body: request,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      await Get.find<AppController>()
          .sharedPreference
          .setString('token', loginResponse.token ?? '');
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception("Invalid Credentials");
    } else {
      throw Exception("Something went wrong");
    }
  }
}
