import 'package:carstatus_app/pages/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  putControllers();
  setControllers();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: Landingpage());
  }
}

void putControllers() {}

void setControllers() {}
