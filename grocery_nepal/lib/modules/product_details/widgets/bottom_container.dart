import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/favorites/favorites_controller.dart';
import 'package:grocery_nepal/modules/product_details/product_detail_controller.dart';

import '../../../constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({required this.product, Key? key}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: greenColor.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              minWidth: 150,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Added to cart'),
                      duration: Duration(milliseconds: 2000),
                      backgroundColor: greenColor),
                );
                Get.find<ProductDetailController>().addToCart();
              },
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              color: greenColor,
              elevation: 0,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GetBuilder<FavoritesController>(builder: (favoriteController) {
            return favoriteController.favorites.firstWhereOrNull(
                        (element) => element.id == product.id) !=
                    null
                ? IconButton(
                    onPressed: () {
                      favoriteController.removeFromFavorites(product);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      favoriteController.addToFavorites(product);
                    },
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
