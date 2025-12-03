import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(body: _pageBody(context), appBar: CsAppbar(pageTitle: "", backButton: true, ),);
  }
}

Widget _pageBody(BuildContext context) {
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
                labelText: 'Benutzername...',
              ),
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
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            //die logik vom registrieren
          },
          child: const CsText(text: "Registrieren", size: 20,),
        ),
      ],
    ),
  );
}