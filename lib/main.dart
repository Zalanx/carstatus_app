import 'package:carstatus_app/pages/LandingPage.dart';
import 'package:flutter/material.dart';

void main() {
  putControllers();
  setControllers();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Landingpage());
  }
}

void putControllers() {}

void setControllers() {}
