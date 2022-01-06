import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/cart_item.dart';
import 'package:grocery_nepal/data/models/product.dart';

import 'widgets/cart_item_tile.dart';

final List<CartItem> cartItems = [
  CartItem(
      Product(
          id: 1,
          name: 'Cabbage',
          image: 'assets/images/dummy_image.png',
          category: 'Vegetables',
          price: 100,
          unit: '1 kg',
          description: 'This is healthy'),
      5),
  CartItem(
      Product(
          id: 1,
          name: 'Cabbage',
          image: 'assets/images/dummy_image.png',
          category: 'Vegetables',
          price: 100,
          unit: '1 kg',
          description: 'This is healthy'),
      5),
  CartItem(
      Product(
          id: 1,
          name: 'Cabbage',
          image: 'assets/images/dummy_image.png',
          category: 'Vegetables',
          price: 100,
          unit: '1 kg',
          description: 'This is healthy'),
      5),
  CartItem(
      Product(
          id: 1,
          name: 'Cabbage',
          image: 'assets/images/dummy_image.png',
          category: 'Vegetables',
          price: 100,
          unit: '1 kg',
          description: 'This is healthy'),
      5),
];

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CartItemTile(cartItems[index]);
            },
          ),
        ));
  }
}
