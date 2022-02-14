import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/favorites/favorites_controller.dart';
import 'package:grocery_nepal/widgets/loading.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: GetBuilder<FavoritesController>(builder: (controller) {
          return controller.favorites.isEmpty
              ? const Center(
                  child: Text('You have no favorites.'),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    itemCount: controller.favorites.length,
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl:
                                  imageUrl + controller.favorites[index].image,
                              placeholder: (context, url) =>
                                  const Loading(size: 100),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/dummy_image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(controller.favorites[index].name),
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
                                                style: TextStyle(
                                                    color: greenColor),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                controller.removeFromFavorites(
                                                    controller
                                                        .favorites[index]);

                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Remove',
                                                style: TextStyle(
                                                    color: Colors.red),
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
                );
        }));
  }
}
