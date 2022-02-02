import 'package:flutter/material.dart';

import '../../../constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
