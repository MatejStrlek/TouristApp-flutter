import 'package:faks/core/style/style_extensions.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/empty_favorites.png",
          width: 400,
        ),
        const SizedBox(height: 30),
        Text(
          "No locations found",
          style: context.textSubtitle,
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "There was nothing found now, try later...",
            style: context.textDescription,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
