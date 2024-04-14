import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../navigation_menu.dart';

export '../view/home_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => MyHomePageState();
}


class MyHomePageState extends State<HomePage> {

  String _scanBarcodeResult = '';

  Future<void> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Annuler', true, ScanMode.BARCODE);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Erreur Technique';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Home"),
            Text(_scanBarcodeResult)],
        ),
      ),
 
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
