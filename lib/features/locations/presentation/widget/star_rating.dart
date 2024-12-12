import 'package:flutter/material.dart';

class StarsRating extends StatelessWidget {
  final int rating;
  final Widget activeStar;
  final Widget inactiveStar;

  const StarsRating({
    super.key,
    required this.rating,
    required this.activeStar,
    required this.inactiveStar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => index < rating ? activeStar : inactiveStar,
      ),
    );
  }
}
