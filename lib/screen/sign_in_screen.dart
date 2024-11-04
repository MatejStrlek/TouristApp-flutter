import 'package:faks/style/style_extensions.dart';
import 'package:faks/widget/custom_primary_button.dart';
import 'package:faks/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/login_image.png", width: 250),
                const SizedBox(height: 20),
                Text(
                  "Please sign in to your account.",
                  style: context.textSubtitle,
                ),
                const SizedBox(height: 20),
                const CustomTextField(label: "Email"),
                const SizedBox(height: 20),
                const CustomTextField(label: "Password"),
                const SizedBox(height: 7),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text("Forgot password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(height: 45),
                const CustomPrimaryButton(text: "Sign in"),
                const Spacer(),
                Text(
                    "Don't have an account? Sign up.",
                    style: context.textSubtitle,
                ) //TODO make this text button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
