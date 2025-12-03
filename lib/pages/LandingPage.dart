import 'package:carstatus_app/components/cs_button.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/pages/Authorization/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(body: _pageBody(context));
  }

  Widget _pageBody(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "Samuel Autohaus GmbH",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 280,
            width: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CsButton(
                  onTap: () => Get.to(() => const LoginPage()),
                  height: 120,
                  width: 200,
                  borderRadius: BorderRadius.circular(16),
                  child: Text("Einloggen"),
                ),
                CsButton(
                  height: 120,
                  width: 200,
                  borderRadius: BorderRadius.circular(16),
                  child: Text("Registrieren"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
