import 'package:carstatus_app/pages/Ticket/ticket.dart';
import 'package:carstatus_app/swagger/output/CarStatusApi.swagger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerController extends GetxController {
  Future<void> handleBarcode(BarcodeCapture capture) async {
    CarStatusApi api = CarStatusApi.create();
    
    Get.log("Barcode erkannt: ${capture.barcodes.first.rawValue}");
    if (capture.barcodes.isNotEmpty) {
      final String barcodeTicketnumber = capture.barcodes.first.rawValue ?? "";

      var response = await api.apiCarStatusGetTicketByIdGet(
        ticketNumber: barcodeTicketnumber,
      );

      if (response.body != null) {
        Get.back(); // Kamera wird ausgemacht
        Get.to(() => TicketPage(ticket: response.body ?? TicketDto()));
      } else {
        Get.snackbar(
          "Fehler",
          "Kein QR Code erkannt",
          backgroundColor: Colors.redAccent,
        );
      }
    }
  }
}
