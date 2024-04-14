import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_first_app/pages/explore/explore_page.dart';
import 'package:flutter_first_app/pages/home/view/home_page.dart';
import 'package:flutter_first_app/pages/library/library_page.dart';
import 'package:flutter_first_app/pages/profile/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 2;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
    return MaterialApp(
        title: 'Insist Scanner',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFDC1A22)),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFDC1A22),
            title: const Text(
              'Insist Scanner',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: [
            HomePage(title: 'Insist Scanner'),
            const ExplorePage(),
            const LibraryPage(),
            const ProfilePage()
          ][_currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: scanBarcode,
            tooltip: 'Scan',
            backgroundColor: Color(0xFFDC1A22),
            child: const Icon(Icons.fullscreen, color: Colors.white),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 30,
            currentIndex: _currentIndex,
            onTap: (index) => setCurrentIndex(index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.web_stories), label: 'Library'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profil'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_vert), label: 'More'),
            ],
          ),
        ));
  }
}
