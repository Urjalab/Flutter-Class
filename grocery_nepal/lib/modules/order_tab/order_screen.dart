import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/order_tile.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order History'),
        ),
        body: Column(
          children: [
            // Container(
            //   child: Text('All'),
            //   color: greenColor,
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return OrderTile();
                    }),
              ),
            ),
          ],
        ));
  }
}
