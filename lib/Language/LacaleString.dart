
import 'package:get/get.dart';
import 'package:test_app_7th/Language/Strings/English.dart';
import 'package:test_app_7th/Language/Strings/Hindi.dart';
import 'package:test_app_7th/Language/Strings/Marathi.dart';
import 'package:test_app_7th/Language/Strings/urdu.dart';

class LacaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en_Us": english,
    "hi_IN": hindi,
    "mh_IN": marathi,
    "ur_PK": urdu,
  };
}