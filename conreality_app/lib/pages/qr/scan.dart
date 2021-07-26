import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerQR extends StatefulWidget {
  @override
  _ScannerQRState createState() => _ScannerQRState();
}

class _ScannerQRState extends State<ScannerQR> {
  final qrKey = GlobalKey(debugLabel: "QR");
  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    super.dispose();
  }

  @override
  void reasseble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildQRScanner(context),
              Positioned(
                child: _buildTitle(),
                top: 40,
                left: 90,
              ),
              Positioned(
                  child: buildResult(),
                ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget buildResult() => Text(
        barcode != null ? 'Result: ${barcode!.code}' : 'Camera View!',
        maxLines: 3,
      );
  Widget _buildTitle() {
    return Container(
        width: 195,
        height: 28,
        child: Text(
          "QR code scaner",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.white,
          ),
        ));
  }

  Widget _buildQRScanner(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderWidth: 10,
          borderColor: Colors.grey,
          borderLength: 130,
          overlayColor: Color.fromRGBO(10, 10, 10, 10),
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
