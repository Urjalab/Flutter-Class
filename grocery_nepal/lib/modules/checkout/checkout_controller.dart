import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
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

  late final ESewaConfiguration _configuration;
  late final ESewaPnp _eSewaPnp;
  @override
  void onInit() {
    super.onInit();
    cartItems = Get.arguments;
    phoneController = TextEditingController();
    cityController = TextEditingController();
    addressController = TextEditingController();

    _configuration = ESewaConfiguration(
        clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
        secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
        environment: ESewaConfiguration.ENVIRONMENT_TEST);
    _eSewaPnp = ESewaPnp(configuration: _configuration);
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
        paymentMethod: isCod.isTrue ? 'COD' : 'eSewa',
        paymentStatus: isCod.isFalse,
        orderItems: orderItems,
      );
      if (isCod.isFalse) {
        await esewaPayment();
      }
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
        errorMessage = e.toString();
      }
      showSnackbar('Error', errorMessage);
    }
  }

  Future<void> esewaPayment() async {
    ESewaPayment _payment = ESewaPayment(
        amount: 500.0,
        productName: "Grocery",
        productID: "123",
        callBackURL: "");

    try {
      final _res = await _eSewaPnp.initPayment(payment: _payment);
    } on ESewaPaymentException catch (e) {
      throw Exception(e.message);
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
