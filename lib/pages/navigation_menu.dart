import 'package:flutter/material.dart';
export '../pages/navigation_menu.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});
  


  
  @override
  State<NavigationMenu> createState() => MyNavigationMenuState();
}

class MyNavigationMenuState extends State<NavigationMenu> {

    int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
      return Scaffold(      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFDC1A22),
        currentIndex: this._currentIndex,
        items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.fullscreen),
          label:'Home'
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.web_stories),
          label:'Library'
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label:'Explore'
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label:'Profil'
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.more_vert),
          label:'More'
          ),
          ],
          onTap:(index){
            setState(() {
              _currentIndex=index;
            });
          }
        ),
    );
  }
}