import 'package:carstatus_app/components/cs_appbar.dart';
import 'package:carstatus_app/components/cs_container.dart';
import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/components/cs_text.dart';
import 'package:carstatus_app/pages/Qr%20Generator%20Page/QrCodeGeneratorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeGenerator extends StatelessWidget {
  const QrCodeGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return CsScaffold(
      body: _pageBody(context),
      appBar: CsAppbar(pageTitle: "", backButton: true),
      resizeToAvoidBottomInset: false,
    );
  }
}

Widget _pageBody(BuildContext context) {
  QrCodeGeneratorController qrCodeGeneratorController =
      Get.find<QrCodeGeneratorController>();
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        height: MediaQuery.sizeOf(context).width * 0.6,
        child: Obx(
          () =>
              qrCodeGeneratorController.data.value.isEmpty
                  ? CsContainer(
                    child: Align(
                      alignment: Alignment.center,
                      child: CsText(
                        text: "QR Code wird hier generiert",
                        size: 18,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                  : PrettyQrView.data(
                    data: qrCodeGeneratorController.data.value,
                  ),
        ),
      ),
      OutlinedButton.icon(
        onPressed: () => qrCodeGeneratorController.printQrCode(),
        icon: const Icon(Icons.print),
        label: CsText(text: "Drucken oder als PDF speichern"),
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
      TextField(
        controller: qrCodeGeneratorController.ticketIdTextController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: 'Geben Sie die Ticketnummer ein...',
        ),
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: () => qrCodeGeneratorController.generateQrCode(),
        child: CsText(text: "QR Code generieren"),
      ),
      SizedBox(height: 16),
    ],
  );
}
