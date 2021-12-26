import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expanded Demo',
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.deepPurpleAccent,
              ),
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.deepPurpleAccent,
                child: Image.network(
                    'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg'),
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.deepPurpleAccent,
              ),
            ],
          ),
        ));
  }
}
