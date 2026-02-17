import 'package:carstatus_app/pages/Ticket%20list/TicketListController.dart';
import 'package:carstatus_app/pages/Ticket%20list/TicketListPage.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketCreationController extends GetxController {
  CarStatusApi api = CarStatusApi.create();

  final TextEditingController todosController = TextEditingController();

  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerCarController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  Future<void> handleCreateTicket() async {
    Ticketlistcontroller ticketlistcontroller = Get.find();
    List<String> todos =
        todosController.text
            .split(',')
            .map((t) => t.trim())
            .where((t) => t.isNotEmpty)
            .toList();

    var userid = await api.apiCarStatusGetUserIdByUsernameGet(
      username: usernameController.text,
    );
    if (userid.body == null) {
      Get.snackbar(
        "Falscher Benutzername!",
        "Bitte geben Sie einen richtigen Benutzernamen ein!",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
      );
      return;
    }

    await api.apiCarStatusCreateTicketPost(
      body: CreateTicketDto(
        userId: userid.body!,
        customerName: customerNameController.text,
        car: customerCarController.text,
        carStatus: CarStatusEnum.warteschlange,
        toDos: todos.map((t) => ToDoDto(task: t, done: false)).toList(),
      ),
    );
    await ticketlistcontroller.fetchTickets();
    Get.to(() => TicketListView());
  }
}
