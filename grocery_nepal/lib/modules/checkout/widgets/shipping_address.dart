import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/checkout/checkout_controller.dart';
import 'package:grocery_nepal/modules/checkout/shipping/shipping_address_edit.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  Widget getAddressRow({required String label, required String data}) {
    return Row(
      children: [
        Expanded(
            child: Text(
          label,
          style: TextStyle(color: Colors.grey.shade600),
        )),
        Expanded(
            child: Text(
          data,
          style: TextStyle(color: Colors.grey.shade600),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Shipping Address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              controller.shippingAddress == null
                  ? const SizedBox()
                  : TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ShippingAddressEdit();
                        }));
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: greenColor),
                      ))
            ],
          ),
          controller.shippingAddress == null
              ? MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ShippingAddressEdit();
                    }));
                  },
                  color: greenColor,
                  child: const Text(
                    'Add shipping address',
                    style: TextStyle(color: Colors.white),
                  ))
              : Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greenColor.withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      getAddressRow(
                          label: "PhoneNumber : ", data: "9876237312"),
                      getAddressRow(label: "Province : ", data: "Gandaki"),
                      getAddressRow(label: "City : ", data: "Pokhara"),
                      getAddressRow(
                          label: "Phone Number :", data: "9876237312"),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
