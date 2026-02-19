import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QrCodeGeneratorController extends GetxController {

  TextEditingController ticketIdTextController = TextEditingController();

  RxString data = "".obs;

  void generateQrCode() {
    String ticketNumber = ticketIdTextController.text.trim();
    if (ticketNumber.isNotEmpty) {
      data.value = ticketNumber;
      update();
    }
  }
}