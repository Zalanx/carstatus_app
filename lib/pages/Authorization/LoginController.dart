import 'package:carstatus_app/pages/Customer%20View/CustomerView.dart';
import 'package:carstatus_app/pages/Customer%20View/CustomerViewController.dart';
import 'package:carstatus_app/pages/Ticket%20list/TicketListController.dart';
import 'package:carstatus_app/pages/Ticket%20list/TicketListPage.dart';
import 'package:carstatus_app/pages/Ticket/ticket.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logincontroller extends GetxController {
  CarStatusApi api = CarStatusApi.create();
  Ticketlistcontroller ticketListController = Get.find();
  Customerviewcontroller customerviewcontroller = Get.find();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ticketnumberController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();

  DbUser? loggedInUser;

  Future<void> handleLogin(UserDto user) async {

    if (ticketnumberController.text.isNotEmpty) {
      var response = await api.apiCarStatusGetTicketByIdGet(
        ticketId: ticketnumberController.text,
      );

      if (response.body != null) {
        Get.to(() => TicketPage(ticket: response.body ?? TicketDto()));
      } else {
        Get.snackbar(
          "Fehler",
          "Kein Ticket mit dieser Nummer gefunden",
          backgroundColor: Colors.redAccent,
        );
      }
      return;
    }


    var response = await api.apiCarStatusLoginUserPost(body: user);

    if (response.body == null) {
      Get.snackbar('Fehler', 'Login fehlgeschlagen: Benutzer nicht gefunden.', );
      return; 
    }

    loggedInUser = response.body;

    if (response.body?.isAdmin == true) {
      await ticketListController.fetchTickets();
      Get.to(() => TicketListView());
    } else {
      await customerviewcontroller.handleLoggedInCustomerTicket();
      Get.to(() => CustomerViewPage());
    }
  }



}
