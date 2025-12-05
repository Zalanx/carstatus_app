import 'package:carstatus_app/swagger/output/swaggerapi.swagger.dart';
import 'package:get/get.dart';

class Ticketlistcontroller extends GetxController {
  Swaggerapi api = Swaggerapi.create();

  List<TicketDto> tickets = [];

  Future<void> fetchTickets() async {
    
     var response = await api.apiCarStatusGetAllTicketsGet();

     tickets = response.body ?? [];
    update();
  }
}