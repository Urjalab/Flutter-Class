import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/auth/change_password/change_password_screen.dart';
import 'package:grocery_nepal/modules/contact_us/contact_us_screen.dart';
import 'package:grocery_nepal/modules/favorites/favorites_screen.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/login_button.dart';
import '../../app_controller.dart';
import 'about_us/about_us_screen.dart';
import 'edit_profile/edit_profile_screen.dart';
import 'widgets/item_tile.dart';
import 'widgets/log_out_button.dart';
import 'widgets/user_detail_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => appController.isLoggedIn.isFalse
                    ? const Divider(
                        thickness: 1,
                      )
                    : Column(
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
                            onPress: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FavoritesScreen();
                              }));
                            },
                          ),
                          ItemTile(
                            icon: Icons.edit_outlined,
                            label: 'Edit Profile',
                            onPress: () {
                              Get.to(() => EditProfileScreen());
                            },
                          ),
                          ItemTile(
                            icon: Icons.lock_outline,
                            label: 'Change Password',
                            onPress: () {
                              Get.to(() => ChangePasswordScreen());
                            },
                          ),
                        ],
                      ),
              ),
              ItemTile(
                icon: Icons.info_outline,
                label: 'About Us',
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutUs();
                  }));
                },
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
              Obx(() => appController.isLoggedIn.isFalse
                  ? const LoginButton()
                  : const LogOutButton()),
            ],
          ),
        ));
  }
}
