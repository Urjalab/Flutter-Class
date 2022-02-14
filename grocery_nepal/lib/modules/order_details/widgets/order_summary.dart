import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/order/order_detail.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary(this.orderDetail, {Key? key}) : super(key: key);
  final OrderDetail orderDetail;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              "Order Summary",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.builder(
                itemCount: orderDetail.items.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${orderDetail.items[index].product.name} x ${orderDetail.items[index].quantity}",
                            ),
                            Text(orderDetail.items[index].product.unit),
                          ],
                        ),
                        Text('Rs.' +
                            orderDetail.items[index].product.price.toString()),
                      ],
                    ),
                  );
                }),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rs. ${orderDetail.total}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
