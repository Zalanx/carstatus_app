import 'package:carstatus_app/pages/Authorization/LoginController.dart';
import 'package:carstatus_app/pages/Ticket%20list/TicketListController.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ticketcontroller extends GetxController {
  Ticketcontroller({required this.ticket}) {
    todoValues.clear();
    for (var todo in ticket.toDos ?? []) {
      todoValues[todo.id] = todo.done;
    }
  }

  CarStatusApi api = CarStatusApi.create();

  late Rx<CarStatusEnum> selectedCarStatus;

  TicketDto ticket;

  void setTicket(TicketDto t) {
    ticket = t;

    customerName.value = ticket.customerName ?? "Kein Name";
    customerNameController = TextEditingController(text: customerName.value);

    customerCar.value = ticket.car ?? "Kein Auto";
    customerCarController = TextEditingController(text: customerCar.value);

    selectedCarStatus = (ticket.carStatus ?? CarStatusEnum.warteschlange).obs;
  }

  RxMap<int, bool> todoValues = <int, bool>{}.obs;

  RxString customerName = "".obs;
  RxString customerCar = "".obs;

  late TextEditingController customerNameController;
  late TextEditingController customerCarController;

  RxBool isEditingName = false.obs;
  RxBool isEditingCar = false.obs;

  void toggleNameEditing() {
    isEditingName.value = !isEditingName.value;
    customerName.value = customerNameController.text;
  }

  void toggleCarEditing() {
    isEditingCar.value = !isEditingCar.value;
    customerCar.value = customerCarController.text;
  }

  RxList<ToDoDto> todos = <ToDoDto>[].obs;

  Future<void> updateCarStatusTicket(TicketDto ticket) async {
    Logincontroller loginController = Get.find();
    Ticketlistcontroller ticketListController = Get.find();

    var returnTodos =
        ticket.toDos!.map((t) {
          final doneValue = todoValues[t.id];
          return ToDoDto(id: t.id, task: t.task, done: doneValue ?? t.done);
        }).toList();

    var updatedTicket = TicketDto(
      ticketnumber: ticket.ticketnumber,
      carStatus: selectedCarStatus.value,
      car: customerCar.value,
      customerName: customerName.value,
      toDos: returnTodos,
      userId: loginController.loggedInUser!.id,
    );
    ticketListController.updateTicket(updatedTicket);

    await api
        .apiCarStatusUpdateTicketPatch(
          ticketnumber: ticket.ticketnumber!,
          newCarStatus: selectedCarStatus.value,
          car: customerCar.value,
          customerName: customerName.value,
          body: returnTodos,
        )
        .then((response) {
          if (response.statusCode == 200) {
            Get.snackbar(
              "Erfolg",
              "Der Status wurde erfolgreich aktualisiert.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              margin: EdgeInsets.all(16),
            );
          } else {
            Get.snackbar(
              "Fehler",
              "Der Status konnte nicht aktualisiert werden.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        });
  }
}
