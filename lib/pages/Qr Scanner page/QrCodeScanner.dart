import 'package:carstatus_app/components/cs_scaffold.dart';
import 'package:carstatus_app/pages/Qr%20Scanner%20page/QrCodeScannerController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final MobileScannerController mobileScannerController =
      MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        detectionTimeoutMs: 1000,
      );

  @override
  void dispose() {
    mobileScannerController
        .dispose(); // Kamera wird nach Get.Back ausgemacht um ressourcen zu sparen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QrCodeScannerController qrCodeScannerController =
        Get.find<QrCodeScannerController>();
    return CsScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: mobileScannerController,
            onDetect: (barcode) {
              qrCodeScannerController.handleBarcode(barcode);
            },
          ),
          QRScannerOverlay(
            borderColor: Colors.redAccent,
            borderRadius: 20,
            borderStrokeWidth: 8,
            scanAreaSize: const Size(250, 250),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => mobileScannerController.toggleTorch(),
                  icon: const Icon(
                    FontAwesomeIcons.boltLightning,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
