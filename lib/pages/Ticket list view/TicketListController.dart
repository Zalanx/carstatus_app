import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:get/get.dart';

class Ticketlistcontroller extends GetxController {
  CarStatusApi api = CarStatusApi.create();

  List<TicketDto> tickets = [];

  Future<void> fetchTickets() async {
    
     var response = await api.apiCarStatusGetAllTicketsGet();

     tickets = response.body ?? [];
     update();
  }
}