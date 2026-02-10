import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_container.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CsContainer(
            decoration: BoxDecoration(
              color: Colors.redAccent[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: CsText(
              text: "Kundenansicht",
              size: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Center(child: Text("Kundenansicht")),
          ...controller.customerTickets.map((ticket) => _ticketCard(ticket, context, controller)),
        ],
      ),
    );
  }
}

Widget _ticketCard(TicketDto ticket, BuildContext context, Customerviewcontroller controller) {
  return Container(
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
        CsText(text: "Kundenname: ${ticket.customerName}", size: 18, fontWeight: FontWeight.bold),
        CsText(text: "Auto: ${ticket.car}", size: 16),
        CsText(text: "Todos:", size: 16, fontWeight: FontWeight.bold),
        ...(ticket.toDos?.map((todo) => CsText(text: "- $todo", size: 14)) ?? [])

      ],
    ),
  );
}
