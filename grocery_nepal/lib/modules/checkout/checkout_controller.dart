import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/order/cart_item.dart';

import 'order_success/order_success.dart';

class CheckoutController extends GetxController {
  final isLoading = false.obs;
  late final List<CartItem> cartItems;
  final isCod = true.obs;

  Map<String, String>? shippingAddress;
  //  {
  //   'phone': '',
  //   'province': '',
  //   'city': '',
  //   'address': '',
  // };

  @override
  void onInit() {
    super.onInit();
    cartItems = Get.arguments;
  }

  void setShippingAddress(Map<String, String> address) {
    shippingAddress = address;
    update();
  }

  Future<void> checkout() async {
    if (shippingAddress == null) {
      Get.snackbar('Empty Shipping Address', 'Please enter shipping address.',
          colorText: Colors.white,
          backgroundColor: Colors.red.withOpacity(0.8));
      return;
    }
    Get.off(() => OrderSuccess());
  }

  bool validateAddress() {
    if (shippingAddress!['phone']!.isEmpty) {
      Get.snackbar('Invalid Phone Number', 'Please enter valid phone number');
      return false;
    }
    if (shippingAddress!['province']!.isEmpty) {
      Get.snackbar('Invalid Province', 'Please choose valid province');
      return false;
    }
    if (shippingAddress!['city']!.isEmpty) {
      Get.snackbar('Invalid City', 'Please enter valid city');
      return false;
    }
    if (shippingAddress!['address']!.isEmpty) {
      Get.snackbar('Invalid Address', 'Please enter valid address');
      return false;
    }
    return true;
  }
}
