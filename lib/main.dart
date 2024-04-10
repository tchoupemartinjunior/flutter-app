import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_first_app/pages/library/library.dart';
// import 'package:barcode_scan/barcode_scan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFDC1A22)),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        // '/': (context) => Loading()
        '/home': (context) => const MyHomePage(title: 'Insist Scanner'),
        '/library': (context) => const Library()
      },
      home: const MyHomePage(title: 'Insist Scanner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(_scanBarcodeResult)],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this._currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled),
                label: 'Home',
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer),
            BottomNavigationBarItem(
                icon: const Icon(Icons.explore),
                label: 'Explore',
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer),
            BottomNavigationBarItem(
                icon: const Icon(Icons.web_stories),
                label: 'Library',
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'Profil',
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer),
            BottomNavigationBarItem(
                icon: const Icon(Icons.more_vert),
                label: 'More',
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, "/home");
                  break;
                case 1:
                  Navigator.pushNamed(context, "/explore");
                  break;
                case 2:
                  Navigator.pushNamed(context, "/library");
                  break;
                case 3:
                  Navigator.pushNamed(context, "/profil");
                  break;
                case 4:
                  Navigator.pushNamed(context, "/more");
                  break;
              }
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: scanBarcode,
        tooltip: 'Scan',
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.fullscreen, color: Colors.white),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
