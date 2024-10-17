import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  final dynamic text1;
  // final String text2;
  // final String text3;

  QRCodeScreen({required this.text1});

  @override
  Widget build(BuildContext context) {
    dynamic data = 'Text 1: $text1';

    return  QrImageView(
      data: data,
      version: QrVersions.auto,
      size: 83,
    );
  }
}