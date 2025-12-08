import 'package:carstatus_app/swagger/output/swaggerapi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ticketcontroller extends GetxController {
  Ticketcontroller({required this.ticket});

  Swaggerapi api = Swaggerapi.create();

  late Rx selectedCarStatus = ticket.carStatus!.obs;

  TicketDto ticket;

  List<DropdownMenuItem> dropdownItem = [];

  void updateCarStatusTicket(TicketDto ticket) {
    api
        .apiCarStatusUpdateTicketPatch(
          ticketnumber: ticket.ticketnumber!,
          newCarStatus: selectedCarStatus.value,
        )
        .then((response) {
          if (response.statusCode == 200) {
            Get.snackbar(
              "Erfolg",
              "Der Status wurde erfolgreich aktualisiert.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
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
