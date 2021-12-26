import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/image.png'),
            ),
            const SizedBox(
              height: 15,
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Amit Parajuli',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                  size: 25,
                  color: Colors.black,
                ),
                title: const Text(
                  '9846856023',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  launch("tel:9846856023");
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                leading: const Icon(
                  Icons.mail,
                  size: 25,
                  color: Colors.black,
                ),
                title: const Text(
                  'parajuliamit@gmail.com',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  launch('mailto:parajuliamit@gmail.com');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
