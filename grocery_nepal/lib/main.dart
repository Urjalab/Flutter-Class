import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Nepal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
            // systemOverlayStyle: SystemUiOverlayStyle(
            //   statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            //   statusBarIconBrightness: Brightness.dark,
            //   statusBarBrightness: Brightness.light,
            // ),
            color: greenColor,
            elevation: 1,
            // titleTextStyle: TextStyle(
            //   color: Colors.black,
            //   fontWeight: FontWeight.w600,
            //   fontSize: 18,
            // ),
            centerTitle: true),
      ),
      home: const HomeScreen(),
    );
  }
}
