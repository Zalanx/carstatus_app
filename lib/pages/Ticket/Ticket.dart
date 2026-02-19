import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_button.dart';
import 'package:carstatus_app/components/cs_container.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Ticket%20list/TicketListPage.dart';
import 'package:carstatus_app/pages/Ticket/Ticketcontroller.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key, required this.ticket});

  final TicketDto ticket;

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      resizeToAvoidBottomInset: true,
      appBar: CsAppbar(pageTitle: "", backButton: true, onBackButtonPressed: () => Get.to(() => TicketListView()),),
      body: _pageBody(context, ticket),
    );
  }

  Widget _pageBody(BuildContext context, TicketDto ticket) {
    Ticketcontroller controller = Get.find<Ticketcontroller>();
    controller.setTicket(ticket);

    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Center(
                child: CsContainer(
                  padding: EdgeInsets.all(15),
                  child: CsText(
                    text: ticket.ticketnumber ?? "Keine Ticketnummer",
                    size: 32,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50, top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CsText(text: "Kundenname: ", size: 26),
                        Expanded(
                          child: Obx(
                            () =>
                                controller.isEditingName.value
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
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CsText(text: "Auto: ", size: 26),
                        Expanded(
                          child: Obx(
                            () =>
                                controller.isEditingCar.value
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
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CsText(text: "Status: ", size: 32, color: Colors.red),
                    SizedBox(width: 25),
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
                                    child: CsText(
                                      text: e.name,
                                      size: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
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
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(width: 2)),
                    ),
                    child: Center(
                      child: CsText(text: "Zu erledigen", size: 28),
                    ),
                  ),
                  CsContainer(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: ListView(
                      children: [
                        ...(controller.ticket.toDos ?? []).map(
                          (todo) => _todoElement(ticket, todo, controller),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  CsButton(
                    height: 60,
                    width: 130,
                    child: CsText(text: "Aktualisieren", size: 16),
                    onTap: () => controller.updateCarStatusTicket(ticket),
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

Widget _todoElement(TicketDto ticket, ToDoDto todo, Ticketcontroller controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Obx(
        () => Checkbox(
          value: controller.todoValues[todo.id] ?? todo.done,
          onChanged: (v) => controller.todoValues[todo.id] = v!,
        ),
      ),
      CsText(text: todo.task!, size: 20),
    ],
  );
}
