import 'package:faks/style/style_extensions.dart';
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
          backgroundColor: context.colorGradientBegin,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: () {},
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colorGradientBegin,
                context.colorGradientEnd,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            constraints: BoxConstraints(
              minHeight: 50
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: context.textButton.copyWith(color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
