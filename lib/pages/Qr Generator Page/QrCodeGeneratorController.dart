import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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

  Future<void> printQrCode() async {
  final doc = pw.Document();
  final String qrData = data.value; // Dein aktueller QR-Inhalt

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.roll80, 
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text("Ticket-ID: $qrData", style: pw.TextStyle(fontSize: 14)),
              pw.SizedBox(height: 10),
              pw.BarcodeWidget(
                data: qrData,
                width: 150,
                height: 150,
                barcode: pw.Barcode.qrCode(),
              ),
            ],
          ),
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => doc.save(),
    name: 'QR_Code_$qrData',
  );
}
}