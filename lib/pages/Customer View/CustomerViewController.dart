import 'package:carstatus_app/pages/Authorization/LoginController.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:get/get.dart';

class Customerviewcontroller extends GetxController {

RxList<TicketDto> customerTickets = <TicketDto>[].obs;

  Future<void> handleLoggedInCustomerTicket() async {
    CarStatusApi api = CarStatusApi.create();

    Logincontroller logincontroller = Get.find();

     if (logincontroller.loggedInUser == null) {
    Get.snackbar('Fehler', 'Kein eingeloggter Benutzer gefunden.');
    return;
  }

    var response = await api.apiCarStatusGetTicketsForUserByIdGet(userId: logincontroller.loggedInUser?.id); //Hier muss noch logincontroller.loggedInUserId übergeben werden, sobald die Login Funktionalität implementiert ist

    customerTickets = response.body!.obs;
  }


}