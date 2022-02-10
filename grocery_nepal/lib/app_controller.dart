import 'package:get/get.dart';
import 'package:grocery_nepal/data/api/user_api.dart';
import 'package:grocery_nepal/data/models/auth/login_response.dart';
import 'package:grocery_nepal/data/models/user/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  final SharedPreferences sharedPreference;
  final isLoggedIn = false.obs;

  AppController(this.sharedPreference) {
    String? token = sharedPreference.getString('token');
    if (token == '' || token == null) {
      isLoggedIn(false);
    } else {
      isLoggedIn(true);
      getUserProfile(token);
    }
  }

  UserProfile? userProfile;
  final isProfileLoading = false.obs;
  final isNoInternet = false.obs;

  void getUserProfile(String token) async {
    isProfileLoading(true);
    isNoInternet(false);
    try {
      userProfile = await UserApi.getProfile(token);
    } catch (e) {
      print(e);
      if (e.toString().contains('SocketException')) {
        isNoInternet(true);
      } else {
        logout();
      }
    }
    isProfileLoading(false);
  }

  void updateProfile(UserProfile user) {
    userProfile = user;
    update();
  }

  void login(LoginResponse loginResponse) {
    isLoggedIn(true);
    userProfile = UserProfile(
        id: loginResponse.id,
        name: loginResponse.name,
        email: loginResponse.email);
  }

  void logout() {
    sharedPreference.setString('token', '');
    isLoggedIn(false);
  }
}
