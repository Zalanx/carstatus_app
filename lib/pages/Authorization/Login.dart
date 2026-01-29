import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Authorization/LoginController.dart';
import 'package:carstatus_app/pages/Ticket%20list%20view/TicketListController.dart';
import 'package:carstatus_app/pages/Ticket%20list%20view/TicketListPage.dart';
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
      const Center(child: CsText(text: "Anmelden", size: 32)),
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
          // await logincontroller.handleLogin(
          //   UserDto(
          //     customerName: logincontroller.usernameController.text,
          //     password: logincontroller.passwordController.text,
          //   ),
          // );

          Get.to(() => TicketListView());
          await Ticketlistcontroller().fetchTickets();
        },
        child: const CsText(text: "Einloggen", size: 20),
      ),
    ],
  );
}
