import 'package:flutter/material.dart';
import '../../navigation_menu.dart';

export '../view/home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  

  @override
  State<HomePage> createState() => MyHomePageState();
}


class MyHomePageState extends State<HomePage> {

  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title,
          style: const TextStyle(color: Colors.white), ),
      ),
       bottomNavigationBar: NavigationMenu()
    );
  }
}
