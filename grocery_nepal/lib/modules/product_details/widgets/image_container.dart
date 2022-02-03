import 'package:flutter/material.dart';

import '../../../constants.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: greenColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl + image,
          errorBuilder: (context, url, error) {
            return Image.asset(
              'assets/images/dummy_image.png',
              fit: BoxFit.fitHeight,
            );
          },
        ),
      ),
    );
  }
}
