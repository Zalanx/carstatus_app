import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_container.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Ticketcreation/TicketcreationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketCreationPage extends StatelessWidget {
  const TicketCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      resizeToAvoidBottomInset: true,
      body: _pageBody(context),
      appBar: CsAppbar(pageTitle: "", backButton: true),
    );
  }
}

Widget _pageBody(BuildContext context) {
  TicketCreationController controller = Get.find();
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Center(
        child: CsContainer(
          child: CsText(
            text: "Ticket erstellen",
            size: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      Column(
        children: [
          TextField(
            controller: controller.usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              labelText: 'Benutzername...',
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            controller: controller.customerNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              labelText: 'Kundenname...',
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            controller: controller.customerCarController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              labelText: 'Auto Modell/Bezeichnung...',
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            controller: controller.todosController,
            decoration: const InputDecoration(
              labelText: "Todos (mit Komma trennen)",
              hintText: "Reifenwechsel, Motoröl wechseln, etc.",
            ),
          ),

          const SizedBox(height: 32),
          
        ],
      ),
      ElevatedButton(
        onPressed: () async {
          await controller.handleCreateTicket();
        },
        child: CsText(text: "Ticket erstellen", size: 20),
      ),
    ],
  );
}
