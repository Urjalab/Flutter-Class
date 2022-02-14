import 'dart:convert';

import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/order/cart_item.dart';

import '../../app_controller.dart';

class CartLocal {
  static String key = "cartLocal";

  static Future<List<CartItem>> get() async {
    var prefs = Get.find<AppController>().sharedPreference;
    var valueString = prefs.getString(key);
    try {
      if (valueString == null || valueString == '') {
        return [];
      }
      var data = json.decode(valueString);
      final cartItems = data as List;
      return cartItems.map((item) => CartItem.fromJson(item)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  static bool set(List<CartItem> cartItems) {
    var data = cartItems.map((item) => item.toJson()).toList();
    var valueString = json.encode(data);
    try {
      var prefs = Get.find<AppController>().sharedPreference;
      prefs.setString(key, valueString);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
