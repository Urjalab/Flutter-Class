import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/modules/controllers/home_controller.dart';

class NextView extends StatelessWidget {
  const NextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(controller.count.value.toString())),
          ElevatedButton(onPressed: controller.increment, child: Text('Press')),
          ElevatedButton(
              onPressed: () {
                Get.back();
                // Navigator.pop(context);
              },
              child: Text('Go Back'))
        ],
      ),
    ));
  }
}
