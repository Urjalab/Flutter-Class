import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 5,
            centerTitle: true,
            title: const Text(
              "Recommend Me",
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Text(
              "+",
              style: TextStyle(fontSize: 22),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "You have pushed buttons this many times",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$counter',
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                      child: Text("Row1"),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                      child: Text("Row2"),
                    )
                  ],
                ),
                ElevatedButton(onPressed: () {}, child: Text("Button"))
              ],
            ),
          ),
        ));
  }
}
