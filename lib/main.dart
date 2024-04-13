// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_app_7th/Language/LacaleString.dart';
import 'package:test_app_7th/screens/HomePage.dart';
import 'package:test_app_7th/screens/Services/LoginPage.dart';
import 'package:test_app_7th/screens/Services/Register.dart';
import 'package:test_app_7th/screens/Services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isUserLoggedIn = await isLoggedIn();

  runApp(Main(isUserLoggedIn: isUserLoggedIn));
}

class Main extends StatefulWidget {
  const Main({Key? key, required bool isUserLoggedIn}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LacaleString(),
      locale: const Locale("en", "US"),
      title: 'Bright Demo-App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/HomePage': (context) => const HomePage(),
        '/Registration': (context) => const RegisterFrm(),
      },
    );
  }
}