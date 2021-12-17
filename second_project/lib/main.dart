import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // ignore: avoid_print
              print('Button is pressed.');
            },
            child: const Text(
              '+',
              style: TextStyle(fontSize: 25),
            ),
          ),
          appBar: AppBar(
            title: const Text('My Project'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Container(
                height: 300,
                width: 200,
                color: const Color(0xff000000),
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
                child: const Text('Hello Again',
                    style: TextStyle(color: Colors.white))),
          )),
    );
  }
}


///  //container
//  body: Container(
//    margin: EdgeInsets.all(30.0),
//    padding: EdgeInsets.all(100.0),
//    color: Colors.blueGrey,
//    child: Text('Hello')
//    ),