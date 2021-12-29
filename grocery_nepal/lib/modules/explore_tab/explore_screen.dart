import 'package:flutter/material.dart';

import 'widgets/search_bar.dart';
import 'widgets/category_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokhara, Nepal'),
        ),
        body: Column(
          children: [
            SearchBar(),
            CategoryBar(),
          ],
        ));
  }
}
