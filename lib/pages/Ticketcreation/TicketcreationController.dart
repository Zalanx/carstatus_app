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

  Future<void> handleCreateTicket() async {
    Ticketlistcontroller ticketlistcontroller = Get.find();
    List<String> todos =
        todosController.text
            .split(',')
            .map((t) => t.trim())
            .where((t) => t.isNotEmpty)
            .toList();

    await api.apiCarStatusCreateTicketPost(
      body: CreateTicketDto(
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
