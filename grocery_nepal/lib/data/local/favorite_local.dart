// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class FavoriteLocal {
//   final String key = "favoriteLocal";
//   final SharedPreferences prefs;

//   FavoriteLocal(this.prefs);

//   void _setTimeStamp() {
//     prefs.setInt(key + "TimeStamp", DateTime.now().microsecondsSinceEpoch);
//   }

//   DateTime lastUpdatedOn() {
//     int? microsecondsSinceEpoch = prefs.getInt(key + "TimeStamp");
//     return DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch!);
//   }

//   Future<Favorites> get() async {
//     var valueString = prefs.getString(key);
//     try {
//       Map<String, dynamic> mapToken = json.decode(valueString!);
//       return Favorites.fromJson(mapToken);
//     } catch (e) {
//       print(e);
//       return Favorites(products: []);
//     }
//   }

//   bool set(Favorites favorites) {
//     var valueMap = favorites.toJson();
//     var valueString = json.encode(valueMap);
//     try {
//       prefs.setString(key, valueString);
//       _setTimeStamp();
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   Future<bool> delete() async {
//     try {
//       // SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString(key, "");
//       _setTimeStamp();
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<bool> isEmpty() async {
//     // SharedPreferences prefs = await SharedPreferences.getInstance();
//     var valueString = prefs.getString(key);
//     if (valueString == "")
//       return true;
//     else
//       return false;
//   }
// }