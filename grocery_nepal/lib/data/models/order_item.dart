import 'package:grocery_nepal/data/models/cart_item.dart';

class Order {
  int id;
  String date;
  String status;
  int total;
  // List<CartItem> items;

  Order({
    required this.id,
    required this.date,
    required this.status,
    // required this.items,
    required this.total,
  });
}