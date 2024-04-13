import 'package:flutter/material.dart';
import 'package:test_app_7th/Database/screens/add_Student.dart';
import 'package:test_app_7th/Database/screens/list_student.dart';
import 'package:test_app_7th/Language/stingTr.dart';

class DatabaseUi extends StatefulWidget {
  const DatabaseUi({Key? key}) : super(key: key);

  @override
  _DatabaseUiState createState() => _DatabaseUiState();
}

class _DatabaseUiState extends State<DatabaseUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return AddStudent();
                    }));
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: const TranslateText(
                  'home_btn1',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ListStudents();
                    }));
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: const TranslateText(
                  'home_btn2',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}