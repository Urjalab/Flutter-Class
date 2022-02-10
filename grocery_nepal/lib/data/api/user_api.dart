import 'dart:convert';

import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/user_profile.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<UserProfile> getProfile(String token) async {
    final url = baseUrl + "users/profile/";
    print(token);
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      UserProfile userProfile = UserProfile.fromJson(data);
      return userProfile;
    } else if (response.statusCode == 401) {
      throw Exception("Invalid Credentials");
    } else {
      print(response.body);
      throw Exception("Something went wrong");
    }
  }
}
