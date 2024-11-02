import 'package:faks/style/colors.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;

  const CustomPrimaryButton({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).extension<AppColors>()!.gradientBegin!,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
