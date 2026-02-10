import 'package:carstatus_app/pages/Customer%20View/CustomerView.dart';
import 'package:carstatus_app/pages/Customer%20View/CustomerViewController.dart';
import 'package:carstatus_app/pages/Ticket%20list/TicketListController.dart';
import 'package:carstatus_app/pages/Ticket%20list/TicketListPage.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logincontroller extends GetxController {
  CarStatusApi api = CarStatusApi.create();
  Ticketlistcontroller ticketListController = Get.find();
  Customerviewcontroller customerviewcontroller = Get.find();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  DbUser? loggedInUser;

  Future<void> handleLogin(UserDto user) async {
    var response = await api.apiCarStatusLoginUserPost(body: user);

    if (response.body == null) {
      Get.snackbar('Fehler', 'Login fehlgeschlagen: Benutzer nicht gefunden.');
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
