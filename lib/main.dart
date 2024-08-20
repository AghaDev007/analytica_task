import 'package:analytica_task/bindings/initializing_dependency.dart';
import 'package:analytica_task/firebase_options.dart';
import 'package:analytica_task/utils/app_routes.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Analytica Commerce',
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppTheme.primary,
        ),
      ),
      initialBinding: InitializingDependency(),
    );
  }
}
