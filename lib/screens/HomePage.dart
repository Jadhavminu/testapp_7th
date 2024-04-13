
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_7th/Database/DatabaseUi.dart';
import 'package:test_app_7th/Language/stingTr.dart';
import 'package:test_app_7th/screens/Services/cardView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const TranslateText(
            'home',
            style: TextStyle(),
          ),
          actions: [
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'setting',
                  child: TranslateText(
                    'setting',
                    style: TextStyle(),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'edit',
                  child: TranslateText(
                    'edit',
                    style: TextStyle(),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Language',
                  child: TranslateText(
                    'Language',
                    style: TextStyle(),
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 'Language') {
                  // Show edit options
                  _showEditPopup(context);
                }
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.only(top: 60),
            children: [
              ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () {
                  // Handle Home menu click
                },
              ),
              const Divider(
                  thickness: 1, indent: 10, endIndent: 10, color: Colors.black),
              ListTile(
                title: const Text('Profile'),
                leading: const Icon(Icons.person),
                onTap: () {
                  // Handle Profile menu click
                },
              ),
              ListTile(
                title: const Text('View'),
                leading: const Icon(Icons.visibility),
                onTap: () {
                  // Handle View menu click
                },
              ),
              ListTile(
                title: const Text('Account'),
                leading: const Icon(Icons.account_circle),
                onTap: () {
                  // Handle Account menu click
                },
              ),
              ListTile(
                title: const Text('Contact'),
                leading: const Icon(Icons.contact_mail),
                onTap: () {
                  // Handle Contact menu click
                },
              ),
              ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.exit_to_app, color: Colors.red),
                onTap: () {
                  // Handle Logout menu click
                },
              ),
            ],
          ),
        ),
        body: const Center(child: DatabaseUi()),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Setting',
                onPressed: () {
                  // Handle Settings button click
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Add',
                onPressed: () {
                  // Handle Add button click
                },
              ),
              IconButton(
                icon: const Icon(Icons.navigation),
                tooltip: 'Navigate',
                onPressed: () {
                  // Handle Navigation button click
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
                tooltip: 'Exit',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CardView();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showEditPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                title: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'English',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  var locale = const Locale('en', 'US');
                  Get.updateLocale(locale);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'हिंदी',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  var locale = const Locale('hi', 'IN');
                  Get.updateLocale(locale);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'मराठी',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  var locale = const Locale('mh', 'IN');
                  Get.updateLocale(locale);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'اردو',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  var locale = const Locale('ur', 'PK');
                  Get.updateLocale(locale);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}