import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order_item.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  const OrderTile(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(1, 1),
                spreadRadius: 2,
                blurRadius: 3)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#${order.id}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                order.date,
                style: const TextStyle(color: greyColor),
              ),
              Text(
                'Rs ${order.total}',
                style: const TextStyle(color: greenColor, fontSize: 16),
              ),
              Text(
                order.status,
                style: const TextStyle(color: greyColor),
              ),
            ],
          ),
          const Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
