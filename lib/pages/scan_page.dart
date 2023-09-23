import 'dart:io' show Platform;
import 'package:app_presensi_pegawai/models/submodels/geo.dart';
import 'package:app_presensi_pegawai/services/api/attendance.dart';
import 'package:app_presensi_pegawai/services/api/auth.dart';
import 'package:app_presensi_pegawai/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Position? position;

  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Scan QR",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.deepPurple,
                borderRadius: 8,
                borderLength: 20,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(""),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    bool isResult = false;

    await LocationService().requestPermission();

    controller.scannedDataStream.listen((Barcode scanData) async {
      controller.pauseCamera();
      if (isResult) {
        Navigator.pushReplacementNamed(context, '/');
        return;
      }

      Position pos = await LocationService().determinePosition();
      String? userId = await AuthService().getUserId();

      isResult = true;

      Geo location = Geo(
        lat: pos.latitude.toString(),
        lng: pos.longitude.toString(),
      );

      await AttendanceService().create(
        userId: int.parse(userId ?? '0'),
        officeId: int.parse(scanData.code.toString()),
        location: location,
      );

      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
