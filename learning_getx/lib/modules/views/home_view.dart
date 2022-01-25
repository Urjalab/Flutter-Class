import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/modules/controllers/home_controller.dart';

import 'next_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(controller.count.value.toString())),
          ElevatedButton(onPressed: controller.increment, child: Text('Press')),
          ElevatedButton(
              onPressed: () {
                Get.to(const NextView());
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const NextView()),
                // );
              },
              child: Text('Next Page')),
          ElevatedButton(
              onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //   content: Text('Snackbar'),
                //   duration: Duration(seconds: 2),
                // ));
                Get.rawSnackbar(message: "Snackbar", duration: 2.seconds);
                // Get.snackbar('Test', 'This is message');
              },
              child: Text('Show Snackbar'))
        ],
      ),
    ));
  }
}
