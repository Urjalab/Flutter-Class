import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/contact_us/contact_us_screen.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/item_tile.dart';

import 'widgets/log_out_button.dart';
import 'widgets/user_detail_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
//Favorites, My Details, Change Password,About Us, Contact Us, Log Out
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const UserDetailBar(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            ItemTile(
              icon: Icons.favorite_outline,
              label: 'Favorites',
              onPress: () {},
            ),
            ItemTile(
              icon: Icons.feed_outlined,
              label: 'My Details',
              onPress: () {},
            ),
            ItemTile(
              icon: Icons.lock_outline,
              label: 'Change Password',
              onPress: () {},
            ),
            ItemTile(
              icon: Icons.info_outline,
              label: 'About Us',
              onPress: () {},
            ),
            ItemTile(
              icon: Icons.feedback_outlined,
              label: 'Contact Us',
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ContactUs();
                }));
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const LogOutButton(),
          ],
        )));
  }
}
