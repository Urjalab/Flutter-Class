import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    required this.errorMessage,
    required this.onRetry,
    Key? key,
  }) : super(key: key);

  final String errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/error.json', width: 150, repeat: false),
          Text(errorMessage),
          ElevatedButton(child: const Text('Try Again'), onPressed: onRetry),
        ],
      ),
    );
  }
}
