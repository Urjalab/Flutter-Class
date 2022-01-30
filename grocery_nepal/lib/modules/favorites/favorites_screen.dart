import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/product.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Product> favourites = [
    Product(
        category: 'Fruites',
        description: 'this is healthy',
        id: 1,
        image: 'assets/images/dummy_image.png',
        name: 'cabbage',
        unit: '5',
        price: 300),
    Product(
        category: 'Fruites',
        description: 'this is healthy',
        id: 1,
        image: 'assets/images/dummy_image.png',
        name: 'cabbage',
        unit: '5',
        price: 300),
    Product(
        category: 'Fruites',
        description: 'this is healthy',
        id: 1,
        image: 'assets/images/dummy_image.png',
        name: 'cabbage',
        unit: '5',
        price: 300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            itemCount: favourites.length,
            itemBuilder: (context, index) => Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    leading: Image.asset(favourites[index].image),
                    title: Text(favourites[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  // title: Text('Remove from favorites?'),
                                  content: const Text(
                                      'Remove the item from favourites?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: greenColor),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          favourites.removeAt(index);
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Remove',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )),
              ),
            ),
          ),
        ));
  }
}
