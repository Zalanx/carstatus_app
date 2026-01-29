import 'package:carstatus_app/pages/Customer%20View/CustomerView.dart';
import 'package:carstatus_app/pages/Ticket%20list%20view/TicketListController.dart';
import 'package:carstatus_app/pages/Ticket%20list%20view/TicketListPage.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logincontroller extends GetxController{

  CarStatusApi api = CarStatusApi.create();
  Ticketlistcontroller ticketListController = Get.find<Ticketlistcontroller>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleLogin(UserDto user) async {

    var response = await api.apiCarStatusLoginUserPost(body: user);


    if (response.body?.isAdmin == true) {
      await ticketListController.fetchTickets();
      Get.to(() => TicketListView());
    } else {
      Get.to(() => CustomerViewPage());
    }
  }


}