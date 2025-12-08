import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Ticket/Ticketcontroller.dart';
import 'package:carstatus_app/swagger/output/swaggerapi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key, required this.ticket});

  final TicketDto ticket;

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      appBar: CsAppbar(pageTitle: "", backButton: true),
      body: _pageBody(context, ticket),
    );
  }

  Widget _pageBody(BuildContext context, TicketDto ticket) {
    Ticketcontroller controller = Ticketcontroller(ticket: ticket);
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(border: Border.all(width: 3)),
                child: CsText(
                  text: ticket.ticketnumber ?? "Keine Ticketnummer",
                  size: 32,
                ),
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.6,
              margin: EdgeInsets.only(top: 60),
              padding: EdgeInsets.all(15),
              color: Colors.grey[300],
              child: Column(
                children: [
                  Row(
                    spacing: 30,
                    children: [
                      CsText(text: "Status: ", size: 20),
                      Obx(
                        () => DropdownButton<CarStatusEnum>(
                          value: controller.selectedCarStatus.value,
                          items:
                              CarStatusEnum.values
                                  .where(
                                    (e) =>
                                        e !=
                                        CarStatusEnum.swaggerGeneratedUnknown,
                                  )
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e.name),
                                    ),
                                  )
                                  .toList(),
                          onChanged:(value) {controller.selectedCarStatus.value = value!;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CsText(text: "Kundenname: ", size: 20),
                      CsText(
                        text: ticket.customerName ?? "Kein Status",
                        size: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CsText(text: "Status: ", size: 20),
                      CsText(text: ticket.car ?? "Kein Auto", size: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
