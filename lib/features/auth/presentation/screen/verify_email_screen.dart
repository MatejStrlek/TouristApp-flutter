import 'package:faks/core/app_route.dart';
import 'package:faks/core/di.dart';
import 'package:faks/core/style/style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VerifyEmailScreen extends HookConsumerWidget {
  final String? arguments;

  const VerifyEmailScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResetPassword = arguments == AppRoute.forgotPassword;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isResetPassword
              ? "Reset Password"
              : "Verify Email",
          style: context.textTitle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  child: Image(
                    image: AssetImage("assets/images/mail_sent.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    isResetPassword
                        ? "Please check your inbox and reset your password."
                        : "Please check your inbox and verify your email address.",
                    style: context.textDescription,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive an email?",
                        style: context.textSubtitle,
                      ),
                      TextButton(
                        onPressed: () {
                          if (isResetPassword) {
                            Navigator.of(context).pushNamed(AppRoute.forgotPassword);
                          } else {
                            ref.read(authNotifier.notifier).resendVerifyEmail();
                          }
                        },
                        child: Text(
                          "Try again",
                          style: context.textSubtitle.copyWith(
                            color: context.colorGradientBegin,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}