import 'package:flutter/material.dart';

import 'category_tile.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return CategoryTile();
            }));
  }
}
