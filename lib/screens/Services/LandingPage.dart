// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:test_app_7th/screens/Services/LoginPage.dart';
import 'package:test_app_7th/screens/Services/Register.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Hello There!",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Automatic identity verification which enable you to verify your identity",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/flutter.png'))),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.pushNamed(context, '/LoginPage',
                        arguments: const LoginPage());
                  },
                  color: const Color.fromARGB(255, 64, 90, 238),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Registration',
                        arguments: const RegisterFrm());
                  },
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "Register ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}