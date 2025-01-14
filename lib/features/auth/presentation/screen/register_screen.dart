import 'package:faks/core/app_route.dart';
import 'package:faks/core/di.dart';
import 'package:faks/core/style/style_extensions.dart';
import 'package:faks/features/auth/presentation/controller/state/auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/custom_primary_button.dart';
import '../widget/custom_text_field.dart';

class RegisterScreen extends StatefulHookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifier);
    final isLoading = useState(false);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    useValueChanged<AuthState, void>(authState, (_, newValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        switch (authState) {
          case AuthenticatedState():
            isLoading.value = false;
            Navigator.of(context).pushReplacementNamed(AppRoute.home);

          case LoadingState():
            isLoading.value = true;

          case UnauthenticatedState(failure: var failure):
            isLoading.value = false;
            final snackBar = SnackBar(
              content: Text(failure!.message),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.maxFinite,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Hero(
                    tag: "starting_image",
                    child: Image.asset("assets/images/login_image.png",
                        width: 150),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Please create an account to continue.",
                    style: context.textSubtitle,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: "Email",
                    controller: emailController,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: "Password",
                    controller: passwordController,
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: "Confirm Password",
                    controller: confirmPasswordController,
                    validator: (value) => _validateConfirmPassword(
                        value, passwordController.text),
                  ),
                  const SizedBox(height: 65),
                  CustomPrimaryButton(
                    child: isLoading.value
                        ? CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            color: Colors.white)
                        : Text("Sign up",
                            style: context.textButton
                                .copyWith(color: Colors.white)),
                    onPressed: () => _register(
                      emailController.text,
                      passwordController.text,
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: context.textSubtitle.copyWith(
                        color: Colors.black.withOpacity(0.7),
                      ),
                      children: [
                        TextSpan(
                          text: "Log in",
                          style: context.textSubtitle.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(AppRoute.signIn);
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Field must not be empty.";
    }
    if (value.length <= 7) {
      return "Password is too short";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Field must not be empty.";
    }
    if (value != password) {
      return "Passwords do not match.";
    }
    return null;
  }

  void _register(final String email, final String password) {
    if (_formKey.currentState!.validate()) {
      ref.read(authNotifier.notifier).register(email, password);
    }
  }
}
