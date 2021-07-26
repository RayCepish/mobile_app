import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:reg_log_pages/pages/reg_part/reg/sign_up/signIn.dart';

class ScannerQRFromSignIn extends StatefulWidget {
  @override
  _ScannerQRFromSignInState createState() => _ScannerQRFromSignInState();
}

class _ScannerQRFromSignInState extends State<ScannerQRFromSignIn> {
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
            Container(
              child: Positioned(
                child: _buildTitle(),
                top: 40,
                left: 90,
              ),
            ),
            Positioned(
              child: buildResult(),
            ),
            Positioned(
              bottom: 22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget buildResult() => Text(
        barcode != null ? 'Result: ${barcode!.code}' : 'Camera View!',
        style: TextStyle(
          fontSize: 10,
          color: Colors.white,
        ),
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
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      width: 315.w,
      height: 50.h,
      child: RaisedButton(
        color: Colors.red[800],
        shape: RoundedRectangleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginForm()),
          );
        },
        child: Text(
          "Go back to sign in",
          style: TextStyle(
              fontFamily: "TTSquares-Italic",
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: Colors.white,
              height: 1.16.h),
          textAlign: TextAlign.center,
        ),
      ),
    );
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
    controller.scannedDataStream.listen(
      (barcode) => setState(() => this.barcode = barcode),
    );
  }
}
