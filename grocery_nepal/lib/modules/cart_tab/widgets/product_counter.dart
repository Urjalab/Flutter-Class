import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter(this.quantity, {Key? key}) : super(key: key);
  final int quantity;
  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int _count = 1;

  @override
  void initState() {
    super.initState();
    _count = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (_count > 1) {
              setState(() {
                _count--;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greenColor,
            ),
            padding: const EdgeInsets.all(2),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Text('$_count'),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _count++;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greenColor,
            ),
            padding: const EdgeInsets.all(2),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
