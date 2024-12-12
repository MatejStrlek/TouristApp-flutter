import 'dart:io';

import 'package:faks/core/style/style_extensions.dart';
import 'package:faks/features/auth/presentation/widget/custom_primary_button.dart';
import 'package:faks/features/locations/domain/model/location.dart';
import 'package:faks/features/locations/presentation/widget/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final location = ModalRoute.of(context)?.settings.arguments as Location;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.network(
              location.imageUrl,
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
                    onPressed: () => Navigator.of(context).pop(),
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
                  Text(
                    location.title,
                    style: context.textTitle,
                  ),
                  Text(
                    location.address,
                    style: context.textSubtitle,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Rating: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  StarsRating(
                    rating: location.rating,
                    activeStar: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          context.colorGradientBegin,
                          context.colorGradientEnd,
                        ],
                      ).createShader(bounds),
                      child: Icon(Icons.star, color: Colors.yellow, size: 28),
                    ),
                    inactiveStar:
                        Icon(Icons.star, color: Colors.grey, size: 28),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    location.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  const Spacer(),
                  CustomPrimaryButton(
                    child: Text(
                      "Show on maps",
                      style: context.textButton,
                    ),
                    onPressed: () => Platform.isAndroid
                        ? _launchAndroidMaps(
                            context, location.lat, location.lng, location.title)
                        : _launchIOSMaps(context, location.lat, location.lng),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchIOSMaps(
    BuildContext context, final double lat, final double lng) async {
  try {
    final url = Uri.parse('maps:$lat,$lng?q=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  } catch (e) {
    if (context.mounted) {
      const snackBar = SnackBar(content: Text("Error opening maps."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

void _launchAndroidMaps(
    BuildContext context, final double lat, final double lng, final String title) async {
  try {
    final url = Uri.parse('geo:$lat,$lng?q=$lat,$lng($title)');
    await launchUrl(url);
  } catch (e) {
    if (context.mounted) {
      const snackBar = SnackBar(content: Text("Error opening maps."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
