import 'package:faks/features/locations/data/database/hive_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_route.dart';
import 'core/style/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveManager.initHive();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist app',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
