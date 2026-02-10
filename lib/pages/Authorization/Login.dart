import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_container.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Authorization/LoginController.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      body: _pageBody(context),
      appBar: CsAppbar(pageTitle: "", backButton: true),
    );
  }
}

Widget _pageBody(BuildContext context) {
  Logincontroller logincontroller = Get.find<Logincontroller>();
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
     Center(child: CsContainer(child: CsText(text: "Anmelden", size: 32))),
      Column(
        children: [
          TextField(
            controller: logincontroller.usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              labelText: 'Benutzername...',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: logincontroller.passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              labelText: 'Passwort...',
            ),
          ),
        ],
      ),
      ElevatedButton(
        onPressed: () async {
          await logincontroller.handleLogin(
            UserDto(
              customerName: "",
              username: logincontroller.usernameController.text,
              password: logincontroller.passwordController.text,
            ),
          );
        },
        child: const CsText(text: "Login", size: 20),
      ),
    ],
  );
}
