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
  //use underscore ahead of a variable to make it private, ex: _color1
  bool firstPressed = false;
  bool secondPressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          //two types of parameters => unnamed and named parameters
          //unnamed parameters are always required and should be written in order.
          title: const Text('Color Changing App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: firstPressed ? Colors.red : Colors.grey,
                  alignment: Alignment.center,
                  child: Text(
                    firstPressed ? "Red" : "Grey",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: secondPressed ? Colors.teal : Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    secondPressed ? "Yellow" : "Black",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        firstPressed = !firstPressed;
                      });
                    },
                    child: Text(firstPressed
                        ? "Revert Changes?"
                        : "Change it to Red?")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        secondPressed = !secondPressed;
                      });
                    },
                    child: Text(secondPressed
                        ? "Revert Changes?"
                        : "Change it to Teal?")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
