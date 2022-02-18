import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/checkout/checkout_controller.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';

class ShippingAddressEdit extends StatelessWidget {
  ShippingAddressEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            children: [
              InputField(
                "Phone Number",
                controller: controller.phoneController,
                inputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                    labelText: "Province",
                    labelStyle: TextStyle(
                      color: Colors.green,
                    )),
                value: controller.selectedProvince,
                items: controller.provinces
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              child: Text(value),
                              value: value,
                            ))
                    .toList(),
                onChanged: (String? newValue) {
                  controller.selectedProvince = newValue;
                },
              ),
              InputField(
                "City",
                controller: controller.cityController,
                textInputAction: TextInputAction.next,
              ),
              InputField(
                "Address",
                controller: controller.addressController,
                inputType: TextInputType.streetAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton("Update", () {
                controller.updateAddress();
              })
            ],
          ),
        ),
      ),
    );
  }
}
