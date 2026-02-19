
import 'package:carstatus_app/helper/Themehelper.dart';
import 'package:carstatus_app/pages/Authorization/LoginController.dart';
import 'package:carstatus_app/pages/Customer%20View/CustomerViewController.dart';
import 'package:carstatus_app/pages/Qr%20Generator%20Page/QrCodeGeneratorController.dart';
import 'package:carstatus_app/pages/Qr%20Scanner%20page/QrCodeScannerController.dart';
import 'package:carstatus_app/pages/Ticket/Ticketcontroller.dart';
import 'package:carstatus_app/pages/Ticketcreation/TicketcreationController.dart';
import 'package:carstatus_app/pages/Landing%20Page/LandingPage.dart';
import 'package:carstatus_app/pages/Ticket%20list/TicketListController.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  putControllers();
  setControllers();
  runApp(const MainApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
  Get.put(Customerviewcontroller());
  Get.put(Logincontroller());
  Get.put(Ticketcontroller(ticket: TicketDto()));
  Get.put(TicketCreationController());
  Get.put(QrCodeScannerController());
  Get.put(QrCodeGeneratorController());
  
}

void setControllers() {
  Get.find<ThemeHelper>();
  Get.find<Ticketlistcontroller>();
  Get.find<Customerviewcontroller>();
  Get.find<Logincontroller>();
  Get.find<Ticketcontroller>();
  Get.find<TicketCreationController>();
  Get.find<QrCodeScannerController>();
  Get.find<QrCodeGeneratorController>();
  
}
