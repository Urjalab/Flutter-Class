import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({Key? key}) : super(key: key);

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
            children: const [
              Text(
                '#1234',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                '19th Jan 2022',
                style: TextStyle(color: greyColor),
              ),
              Text(
                'Rs 250',
                style: TextStyle(color: greenColor, fontSize: 16),
              ),
              Text(
                'Processing',
                style: TextStyle(color: greyColor),
              ),
            ],
          ),
          const Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
