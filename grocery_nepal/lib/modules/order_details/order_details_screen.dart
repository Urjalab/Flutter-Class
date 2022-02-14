import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'order_detail_controller.dart';
import 'widgets/order_summary.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderDetailController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Detail"),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Loading()
            : controller.isError.isTrue
                ? ErrorPage(
                    errorMessage: controller.errorMessage,
                    onRetry: controller.getOrderDetails)
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "#${controller.orderDetail!.id}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                          "${controller.orderDetail!.dateOrdered}"),
                                    ],
                                  ),
                                  Text(
                                    controller.orderDetail!.status ?? '',
                                    style: TextStyle(
                                        color: controller.orderDetail!.status ==
                                                'Delivered'
                                            ? greenColor
                                            : controller.orderDetail!.status ==
                                                    'Cancelled'
                                                ? Colors.red
                                                : Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text("Delivered To :"),
                                      Text(
                                        controller
                                                .orderDetail!.shippingAddress ??
                                            'NA',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("Payment Method"),
                                      Text(
                                        controller.orderDetail!.paymentMethod ??
                                            'NA',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          OrderSummary(controller.orderDetail!),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Payment Status: "),
                                  controller.orderDetail!.paymentStatus == true
                                      ? const Text(
                                          "PAID",
                                          style: TextStyle(color: greenColor),
                                        )
                                      : const Text(
                                          "UNPAID",
                                          style: TextStyle(color: Colors.red),
                                        )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
