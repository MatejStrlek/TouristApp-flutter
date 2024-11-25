import 'package:faks/core/error/failure.dart';
import 'package:faks/core/style/style_extensions.dart';
import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final Failure failure;

  const ErrorStateWidget({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/error_404_image.png",
          width: 400,
        ),
        const SizedBox(height: 30),
        Text(
          "There was an error",
          style: context.textSubtitle,
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "Please try again later or check internet connection...",
            style: context.textDescription,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
