import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/data/api/order_api.dart';
import 'package:grocery_nepal/data/models/order/cart_item.dart';
import 'package:grocery_nepal/data/models/order/order_request.dart';
import 'package:grocery_nepal/modules/cart_tab/cart_controller.dart';
import 'package:grocery_nepal/modules/order_tab/order_controller.dart';

import 'order_success/order_success.dart';

class CheckoutController extends GetxController {
  final isLoading = false.obs;
  late final List<CartItem> cartItems;
  final isCod = true.obs;

  late final TextEditingController phoneController;
  late final TextEditingController cityController;
  late final TextEditingController addressController;

  final List<String> provinces = [
    "Province 1",
    "Madesh",
    "Bagmati",
    "Gandaki",
    "Lumbini",
    "Karnali",
    "Sudur Pashchim",
  ];
  String? selectedProvince;

  Map<String, String>? shippingAddress;
  String? fullAddress;

  @override
  void onInit() {
    super.onInit();
    cartItems = Get.arguments;
    phoneController = TextEditingController();
    cityController = TextEditingController();
    addressController = TextEditingController();
  }

  Future<void> checkout() async {
    if (shippingAddress == null) {
      showSnackbar('Empty Shipping Address', 'Please enter shipping address.');
      return;
    }
    isLoading(true);
    try {
      List<OrderItems> orderItems = List.generate(
          cartItems.length,
          (index) => OrderItems(
              product: cartItems[index].product.id,
              quantity: cartItems[index].quantity));
      OrderRequest orderRequest = OrderRequest(
        shippingAddress: fullAddress ?? '',
        phoneNumber: shippingAddress!['phone'] ?? '',
        paymentMethod: isCod.isTrue ? 'COD' : 'Khalti',
        paymentStatus: isCod.isFalse,
        orderItems: orderItems,
      );
      var orderResponse = await OrderApi.confirmOrder(orderRequest);
      Get.find<CartController>().clearCart();
      isLoading(false);
      String token = Get.find<AppController>().getToken();
      Get.find<OrderController>().getOrders(token);
      Get.off(() => OrderSuccess(orderResponse));
    } catch (e) {
      isLoading(false);
      String errorMessage;
      print(e.toString());
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = 'Unable to process your order.';
      }
      showSnackbar('Error', errorMessage);
    }
  }

  void showSnackbar(String title, String message) {
    Get.snackbar(title, message,
        colorText: Colors.white, backgroundColor: Colors.red.withOpacity(0.8));
  }

  void updateAddress() {
    String phone = phoneController.text.trim();
    String city = cityController.text.trim();
    String address = addressController.text.trim();

    if (phone.isEmpty) {
      showSnackbar('Invalid Phone Number', 'Please enter valid phone number');
      return;
    }
    if (selectedProvince == null) {
      showSnackbar('Invalid Province', 'Please choose valid province');
      return;
    }
    if (city.isEmpty) {
      showSnackbar('Invalid City', 'Please enter valid city');
      return;
    }
    if (address.isEmpty) {
      Get.snackbar('Invalid Address', 'Please enter valid address');
      return;
    }
    fullAddress = "$address, $city, $selectedProvince";
    shippingAddress = {
      "phone": phone,
      "city": city,
      "address": address,
      "province": selectedProvince!
    };
    update();
    Get.back();
  }
}
