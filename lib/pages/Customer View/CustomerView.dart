import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_container.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Customer%20View/CustomerCarView.dart';
import 'package:carstatus_app/pages/Customer%20View/CustomerViewController.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerViewPage extends StatelessWidget {
  const CustomerViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      appBar: CsAppbar(pageTitle: "", backButton: true),
      body: _pageBody(context),
    );
  }

  Widget _pageBody(BuildContext context) {
    Customerviewcontroller controller = Get.find();
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CsContainer(
            decoration: BoxDecoration(
              color: Colors.redAccent[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: CsText(
              text: "Autos bei uns:",
              size: 40,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 16),
          CsText(
            text: "Bitte wählen Sie das Auto das Sie :",
            size: 26,
            fontWeight: FontWeight.w700,
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  controller.customerTickets.isEmpty
                      ? 1
                      : controller.customerTickets.length,
              itemBuilder: (context, index) {
                if (controller.customerTickets.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CsText(
                      text: "Kein Fahrzeug in der Werkstatt",
                      size: 32,
                      textAlign: TextAlign.center,
                      color: Colors.orange,
                    ),
                  );
                } else {
                  return _ticketCard(
                    controller.customerTickets[index],
                    context,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _ticketCard(TicketDto ticket, BuildContext context) {
  return GestureDetector(
    onTap: () => Get.to(() => CustomerCarView(ticket: ticket)),
    child: Container(
      width: 220,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.redAccent[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CsText(
            text: "Kundenname: ${ticket.customerName}",
            size: 18,
            fontWeight: FontWeight.bold,
          ),
          CsText(text: "Auto: ${ticket.car}", size: 16),
          CsText(text: "Todos:", size: 16, fontWeight: FontWeight.bold),
          ...(ticket.toDos?.map(
                (todo) => CsText(text: "- ${todo.task}", size: 14),
              ) ??
              []),
        ],
      ),
    ),
  );
}
