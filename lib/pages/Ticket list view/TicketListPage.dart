import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Ticket%20list%20view/TicketListController.dart';
import 'package:carstatus_app/swagger/output/swaggerapi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketListView extends StatelessWidget {
  const TicketListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(appBar: CsAppbar(pageTitle: "", backButton: true,),body: _pageBody(context),);
  }
}

Widget _pageBody(BuildContext context) {
  Ticketlistcontroller controller = Get.find<Ticketlistcontroller>();
  return SizedBox(
    height: MediaQuery.sizeOf(context).height,
    width: MediaQuery.sizeOf(context).width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Center(
          child: CsText(text: "Verfügbare Tickets", size: 34),
        ),
        Container(
          height: MediaQuery.sizeOf(context).height * 0.7,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView(
            children: [
              ...controller.tickets.map((ticket) => _ticketCard(ticket, context)
              ),
            ],
        ),
        ),
      ],
    ),
  );
}

Widget _ticketCard(TicketDto ticket, BuildContext context) {
  return Container( height: 150,
   width: MediaQuery.sizeOf(context).width * 0.9,
   decoration: BoxDecoration(
    border: Border.all(color: Colors.black, width: 2),
    borderRadius: BorderRadius.circular(12),
   ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CsText(text: ticket.ticketnumber ?? "Keine Ticketnummer"),
      CsText(text: ticket.car ?? "Kein Auto"),
      CsText(text: ticket.carStatus.toString()),
    ],
  ),
  );
}