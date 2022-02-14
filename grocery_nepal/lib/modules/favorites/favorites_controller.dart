import 'package:get/get.dart';
import 'package:grocery_nepal/data/local/favorite_local.dart';
import 'package:grocery_nepal/data/models/product/product.dart';

class FavoritesController extends GetxController {
  List<Product> favorites = [];

  @override
  void onInit() {
    getFavorites();
    super.onInit();
  }

  Future<void> getFavorites() async {
    favorites = await FavoriteLocal.get();
    update();
  }

  void addToFavorites(Product product) async {
    favorites.add(product);
    FavoriteLocal.set(favorites);
    getFavorites();
  }

  void removeFromFavorites(Product product) async {
    favorites.removeWhere((element) => element.id == product.id);
    FavoriteLocal.set(favorites);
    getFavorites();
  }
}
