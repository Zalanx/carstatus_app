import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Authorization/RegistrationController.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(body: _pageBody(context), appBar: CsAppbar(pageTitle: "", backButton: true, ),);
  }
}

Widget _pageBody(BuildContext context) {
  Registrationcontroller controller = Registrationcontroller();
  return SizedBox(
    height: MediaQuery.sizeOf(context).height,
    width: MediaQuery.sizeOf(context).width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Center(
          child: CsText(text: "Registrieren", size: 32,),
        ),
        Column(
          children: [
             TextField(

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Kundenname...',
              ),
              controller: controller.registrationCustomerName,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Benutzername...',
              ),
              controller: controller.registrationUsername,
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Passwort...',
              ),
              controller: controller.registrationPassword,
            ),
            const SizedBox(height: 16),
           TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Passwort wiederholen...',
              ),
              controller: controller.doubleCheckedPassword,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            controller.registerUser();
          },
          child: const CsText(text: "Registrieren", size: 20,),
        ),
      ],
    ),
  );
}