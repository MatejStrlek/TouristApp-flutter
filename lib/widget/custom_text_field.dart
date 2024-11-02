import 'package:faks/style/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).extension<AppColors>()!.border!,
                width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: label,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).extension<AppColors>()!.border!,
                width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
