import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/explore_tab/explore_tab_controller.dart';

import 'product_tile.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<Product> products = Get.find<ExploreTabController>().products;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = '';
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_sharp));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchResult = [];
    for (Product product in products) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchResult.add(product);
      }
    }
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: matchResult.isEmpty
          ? const Center(
              child: Text(
                'No matching results.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )
          : GridView.builder(
              itemCount: matchResult.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 150 / 190,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return ProductTile(
                  product: matchResult[index],
                );
              }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchResult = [];
    for (Product product in products) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchResult.add(product);
      }
    }
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: matchResult.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 150 / 190,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return ProductTile(
              product: matchResult[index],
            );
          }),
    );
  }
}
