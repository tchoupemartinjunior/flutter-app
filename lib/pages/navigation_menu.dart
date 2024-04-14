import 'package:flutter/material.dart';
export '../pages/navigation_menu.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});
   final int _currentIndex=0;

  @override
  State<NavigationMenu> createState() => MyNavigationMenuState();
}

class MyNavigationMenuState extends State<NavigationMenu> {

    int _currentIndex=0;
    setCurrentIndex(int index){
  setState(() {
      _currentIndex =index;
  });
    }

  @override
  Widget build(BuildContext context) {
      return Scaffold(      
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 30,
          currentIndex: this._currentIndex,
          onTap:(index)=>setCurrentIndex(index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore'
              ),
            BottomNavigationBarItem(
                icon: Icon(Icons.web_stories),
                label: 'Library'
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil'
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_vert),
                label: 'More'
               ),
          ],
),
    );
  }
}