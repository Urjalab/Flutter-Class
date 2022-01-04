import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class UserDetailBar extends StatelessWidget {
  const UserDetailBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'John Doe',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'johndoe@gmail.com',
                style: TextStyle(color: greyColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
