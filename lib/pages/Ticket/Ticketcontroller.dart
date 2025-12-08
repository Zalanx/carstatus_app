import 'package:carstatus_app/swagger/output/swaggerapi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ticketcontroller extends GetxController {
  Ticketcontroller({required this.ticket}) {
    customerName.value = ticket.customerName ?? "Kein Name";
    customerNameController = TextEditingController(text: customerName.value);

    customerCar.value = ticket.car ?? "Kein Auto";
    customerCarController = TextEditingController(text: customerCar.value);
  }

  Swaggerapi api = Swaggerapi.create();

  late Rx selectedCarStatus = ticket.carStatus!.obs;

  TicketDto ticket;

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
