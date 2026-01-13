import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:carstatus_app/swagger/output/client_index.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Registrationcontroller extends GetxController {
  CarStatusApi api = CarStatusApi.create();

  final TextEditingController registrationUsername = TextEditingController();
  final TextEditingController registrationPassword = TextEditingController();
  final TextEditingController registrationCustomerName =
      TextEditingController();
  final TextEditingController doubleCheckedPassword = TextEditingController();

  void registerUser() {



    final registrationBody = UserDto(
      username: registrationUsername.text,
      password: registrationPassword.text,
      customerName: registrationCustomerName.text,
    );

    api.apiCarStatusRegisterUserPost(body: registrationBody);
  }
}
