import 'package:carstatus_app/pages/Ticket/Ticketcontroller.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:get/get.dart';

class Ticketlistcontroller extends GetxController {
  CarStatusApi api = CarStatusApi.create();

  RxList<TicketDto> tickets = <TicketDto>[].obs;

  Future<void> fetchTickets() async {
    
     var response = await api.apiCarStatusGetAllTicketsGet();

     tickets = response.body!.obs;
     update();
  }

  Future<void> fetchTodos(String ticketId) async {
    Ticketcontroller ticketcontroller = Get.find();

    var response = await api.apiCarStatusGetTicketByIdGet(ticketId: ticketId);

    var ticket = response.body!;

     ticketcontroller.todos = ticket.toDos!.obs;
     update();
  }

void updateTicket(TicketDto updatedTicket) {
    final index = tickets.indexWhere(
      (t) => t.ticketnumber == updatedTicket.ticketnumber,
    );

    if (index != -1) {
      tickets[index] = updatedTicket;
      tickets.refresh();
    }
  }

}