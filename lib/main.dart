import 'dart:io';

import 'package:carstatus_app/helper/Themehelper.dart';
import 'package:carstatus_app/pages/Landing%20Page/LandingPage.dart';
import 'package:carstatus_app/pages/Ticket%20list%20view/TicketListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  putControllers();
  setControllers();
  HttpOverrides.global = MyHttpOverrides();
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

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // akzeptiert alle Zertifikate (nur für Entwicklung!)
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}


void putControllers() {
  Get.put(ThemeHelper());
  Get.put(Ticketlistcontroller());
}

void setControllers() {
  Get.find<ThemeHelper>();
  Get.find<Ticketlistcontroller>();
}
