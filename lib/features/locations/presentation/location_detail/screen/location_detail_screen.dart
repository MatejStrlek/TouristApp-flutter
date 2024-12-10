import 'package:faks/core/style/style_extensions.dart';
import 'package:faks/features/auth/presentation/widget/custom_primary_button.dart';
import 'package:flutter/material.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/placeholder.jpg",
              height: screenSize.height / 2.5,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: context.colorBackground,
                  child: IconButton(
                    color: context.colorGradientEnd,
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_left_rounded, size: 35),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height / 2.7),
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: context.colorBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location Name"),
                  Text("Location Address"),
                  Text("Rating"),
                  Text("Description"),
                  Spacer(),
                  CustomPrimaryButton(
                      child: Text(
                        "Show on maps",
                        style: context.textButton,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
