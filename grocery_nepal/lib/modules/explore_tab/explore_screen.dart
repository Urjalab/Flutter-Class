import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/explore_tab/explore_tab_controller.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

import 'widgets/search_bar.dart';
import 'widgets/category_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreTabController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grocery Nepal'),
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? const Loading()
              : controller.isError.isTrue
                  ? ErrorPage(
                      errorMessage: controller.errorMessage,
                      onRetry: controller.getProducts)
                  : Column(
                      children: [
                        SearchBar(),
                        Expanded(
                            child: CategoryBar(products: controller.products)),
                      ],
                    ),
        ));
  }
}
