import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_7th/screens/Services/LoginPage.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit App'),
      content: const Text('Do you want to exit from the app?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        ElevatedButton(
          onPressed: () async {
            final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
            sharedPreferences.clear();
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}