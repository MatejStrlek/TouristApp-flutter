import 'package:faks/core/di.dart';
import 'package:faks/core/style/style_extensions.dart';
import 'package:faks/features/auth/presentation/widget/custom_primary_button.dart';
import 'package:faks/features/auth/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: context.textTitle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Image(
              image: AssetImage('assets/images/reset_password_email.png'),
              width: 300,
            ),
          ),
          Text(
            "Please enter your email address to reset your password.",
            style: context.textSubtitle,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          const SizedBox(height: 50),
          Form(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(children: [
              CustomTextField(
                label: 'Email',
                controller: emailController,
                validator: _validateEmail,
              ),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                child: const Text(
                  "Reset Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  ref.read(authNotifier.notifier).resetPassword(
                        context,
                        emailController.text,
                      );
                },
              ),
            ]),
          ))
        ],
      )),
    );
  }

  String? _validateEmail(String? value) {
    final regex = RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
    if (value == null || value.isEmpty) {
      return "Field must not be empty.";
    }
    if (!regex.hasMatch(value)) {
      return "Please enter valid email.";
    }
    return null;
  }
}
