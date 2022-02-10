import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

import '../../../app_controller.dart';

class UserDetailBar extends StatelessWidget {
  const UserDetailBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
            backgroundColor: greyColor,
          ),
          const SizedBox(
            width: 15,
          ),
          Obx(
            () => appController.isProfileLoading.isTrue
                ? const Loading(
                    size: 50,
                  )
                : appController.isNoInternet.isTrue
                    ? ElevatedButton(
                        onPressed: appController.getUserProfile,
                        child: const Text('Try Again'))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appController.userProfile!.name ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            appController.userProfile!.email ?? '',
                            style: const TextStyle(color: greyColor),
                          ),
                        ],
                      ),
          )
        ],
      ),
    );
  }
}
