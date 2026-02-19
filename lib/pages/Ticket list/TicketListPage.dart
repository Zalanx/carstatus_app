import 'package:carstatus_app/components/cs_container.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Qr%20Generator%20Page/QrCodeGenerator.dart';
import 'package:carstatus_app/pages/Ticketcreation/TicketCreation.dart';
import 'package:carstatus_app/pages/Ticket%20list/TicketListController.dart';
import 'package:carstatus_app/pages/Ticket/Ticket.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TicketListView extends StatelessWidget {
  const TicketListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      resizeToAvoidBottomInset: true,
      appBar: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: FaIcon(FontAwesomeIcons.arrowLeft),
            ),
            IconButton(
              onPressed: () => Get.to(() => QrCodeGenerator()),
              icon: const Icon(FontAwesomeIcons.qrcode),
            ),
          ],
        ),
      ),
      body: _pageBody(context),
    );
  }
}

Widget _pageBody(BuildContext context) {
  Ticketlistcontroller controller = Get.find<Ticketlistcontroller>();
  return SafeArea(
    child: SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: CsContainer(
              child: CsText(text: "Verfügbare Tickets", size: 34),
            ),
          ),
          ElevatedButton(
            onPressed: () => Get.to(() => TicketCreationPage()),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
            ),
            child: CsText(
              text: "+ Ticket erstellen",
              size: 20,
              color: Colors.white,
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.65,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(12),
              color: Colors.redAccent[100],
            ),
            child: Obx(
              () => ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  ...controller.tickets.map(
                    (ticket) => _ticketCard(ticket, context, controller),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _ticketCard(
  TicketDto ticket,
  BuildContext context,
  Ticketlistcontroller controller,
) {
  return GestureDetector(
    onTap: () async {
      await controller.fetchTodos(ticket.ticketnumber!);
      Get.to(() => TicketPage(ticket: ticket));
    },
    child: Container(
      height: 150,
      width: MediaQuery.sizeOf(context).width * 0.9,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CsText(text: ticket.ticketnumber ?? "Keine Ticketnummer"),
          CsText(text: ticket.car ?? "Kein Auto"),
          CsText(text: ticket.carStatus?.value ?? "Kein Status"),
        ],
      ),
    ),
  );
}
