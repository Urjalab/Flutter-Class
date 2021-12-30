import 'package:flutter/material.dart';

import '../../../data/models/category.dart';
import 'category_tile.dart';

final List<Category> categories = [
  Category(name: 'All', icon: 'assets/icons/all.svg'),
  Category(name: 'Vegetables', icon: 'assets/icons/vegetable.svg'),
  Category(name: 'Fruits', icon: 'assets/icons/fruit.svg'),
  Category(name: 'Meat', icon: 'assets/icons/meat.svg'),
  Category(name: 'Fish', icon: 'assets/icons/fish.svg'),
];

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                child: CategoryTile(
                  category: categories[index],
                  isSelected: selectedCategory == index,
                ),
              );
            }));
  }
}
