import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
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
          children: const [
            SizedBox(
              height: 15,
            ),
            UserDetailBar(),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
            ),
            ItemTile(icon: Icons.favorite_outline, label: 'Favorites'),
            ItemTile(icon: Icons.feed_outlined, label: 'My Details'),
            ItemTile(icon: Icons.lock_outline, label: 'Change Password'),
            ItemTile(icon: Icons.info_outline, label: 'About Us'),
            ItemTile(icon: Icons.feedback_outlined, label: 'Contact Us'),
            SizedBox(
              height: 40,
            ),
            LogOutButton(),
          ],
        )));
  }
}
