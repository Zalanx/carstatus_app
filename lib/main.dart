
import 'package:carstatus_app/helper/Themehelper.dart';
import 'package:carstatus_app/pages/Authorization/LoginController.dart';
import 'package:carstatus_app/pages/Landing%20Page/LandingPage.dart';
import 'package:carstatus_app/pages/Ticket%20list%20view/TicketListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  putControllers();
  setControllers();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeHelper>();
    return Obx(() => GetMaterialApp(theme: ThemeData.light(), darkTheme: ThemeData.dark(), themeMode: theme.darkmode.value ? ThemeMode.dark : ThemeMode.light, home: Landingpage()));
  }
}

void putControllers() {
  Get.put(ThemeHelper());
  Get.put(Ticketlistcontroller());
  Get.put(Logincontroller());
}

void setControllers() {
  Get.find<ThemeHelper>();
  Get.find<Ticketlistcontroller>();
  Get.find<Logincontroller>();
}
