import 'package:carstatus_app/pages/Authorization/Login.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Registrationcontroller extends GetxController {
  CarStatusApi api = CarStatusApi.create();

  final TextEditingController registrationUsername = TextEditingController();
  final TextEditingController registrationPassword = TextEditingController();
  final TextEditingController registrationCustomerName =
      TextEditingController();
  final TextEditingController doubleCheckedPassword = TextEditingController();

  Future<void> registerUser() async {

    final registrationBody = UserDto(
      customerName: registrationCustomerName.text,
      username: registrationUsername.text,
      password: registrationPassword.text,
    );

    
  try{
    await api.apiCarStatusRegisterUserPost(body: registrationBody);

    Get.snackbar('Erfolg', 'Benutzer erfolgreich registriert');
    Get.to(() => LoginPage()); 
  } catch (e) {
    Get.snackbar('Fehler', 'Registrierung fehlgeschlagen: $e');
  }

    
  }
}
