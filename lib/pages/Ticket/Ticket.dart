import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Ticket/Ticketcontroller.dart';
import 'package:carstatus_app/swagger/output/swaggerapi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key, required this.ticket});

  final TicketDto ticket;

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      backgroundColor: Colors.grey[300],
      appBar: CsAppbar(pageTitle: "", backButton: true,),
      body: _pageBody(context, ticket),
    );
  }

  Widget _pageBody(BuildContext context, TicketDto ticket) {
    Ticketcontroller controller = Ticketcontroller(ticket: ticket);
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(border: Border.all(width: 3),
                  color: Colors.grey[500],),
                  child: CsText(
                    text: ticket.ticketnumber ?? "Keine Ticketnummer",
                    size: 32,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50, top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CsText(text: "Kundenname: ", size: 26),
                        Expanded(
                          child: Obx(
                            () => controller.isEditingName.value
                                ? TextField(
                                  controller:
                                      controller.customerNameController,
                                  style: TextStyle(fontSize: 20),
                                  maxLength: 20,
                                )
                                : Text(
                                  controller.customerName.value,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => controller.toggleNameEditing(),
                          icon: FaIcon(FontAwesomeIcons.penToSquare),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CsText(text: "Auto: ", size: 26),
                        Expanded(
                          child: Obx(
                            () => controller.isEditingCar.value
                                ? TextField(
                                  controller:
                                      controller.customerCarController,
                                  style: TextStyle(fontSize: 20),
                                  maxLength: 20,
                                )
                                : Text(
                                  controller.customerCar.value,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => controller.toggleCarEditing(),
                          icon: FaIcon(FontAwesomeIcons.penToSquare),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CsText(text: "Status: ", size: 32, color: Colors.red,),
                        SizedBox(width: 25,),
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
                                        alignment: Alignment.center,
                                        child: CsText(text: e.name, size: 20, fontWeight: FontWeight.w900,),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              controller.selectedCarStatus.value = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                  



            ],
          ),
        ),
      ),
    );
  }
}
