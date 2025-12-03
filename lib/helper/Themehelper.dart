import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeHelper extends GetxController {
  RxBool darkmode = false.obs;

  void toggleTheme(bool value) {
    darkmode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }
}
