import 'package:carstatus_app/pages/Ticket/Ticket.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:get/get.dart';

class Todohelper extends GetxController{
  TicketPage ticketpage = Get.find();
Todohelper({required this.ticket});


final TicketDto ticket;

void createCheckboxesForTicket(TicketDto ticket){
  ticket.toDos?.forEach((todo) {
   
    

  });
}




}