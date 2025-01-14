import 'package:faks/core/style/style_extensions.dart';
import 'package:flutter/material.dart';

class CustomSecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CustomSecondaryButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 3.5,
              color: Colors.transparent,
            ),
            gradient: LinearGradient(
              colors: [
                context.colorGradientBegin,
                context.colorGradientEnd,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    context.colorGradientBegin,
                    context.colorGradientEnd,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              child: DefaultTextStyle(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Text size
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
