import 'package:faks/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:faks/features/common/presentation/screen/home_screen.dart';
import 'package:faks/features/locations/presentation/location_detail/screen/location_detail_screen.dart';
import 'package:flutter/material.dart';

import '../features/initialisation/screen/splash_screen.dart';

class AppRoute {
  AppRoute._();

  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String home = '/home';
  static const String details = '/details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case details:
        return MaterialPageRoute(builder: (_) => const LocationDetailScreen());
      default:
        throw Exception('Unknown route: ${settings.name}');
    }
  }
}