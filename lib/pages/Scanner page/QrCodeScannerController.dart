import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerController extends GetxController {
  void handleScannedBarcode(BarcodeCapture barcode) {
    // return Future.value(barcode.toString());
    print(barcode.toString());
  }

  void test(BarcodeCapture capture) {
  if (capture.barcodes.isNotEmpty) {
    final String? code = capture.barcodes.first.rawValue;
    print("Gescannter Code: $code");
  }
}
}
