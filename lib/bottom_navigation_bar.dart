import 'package:flutter/material.dart';
import 'package:store/home_page.dart';
import 'package:store/profile.dart';

import 'catigories.dart';



class BottomNavBar extends StatefulWidget {
  final int initialIndex;
    const BottomNavBar({super.key, required this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedIndex =0;

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch(index){
      case 0: _navigateToRoute(context, '/Home', HomePage());
 break;
      case 1: _navigateToRoute(context, '/Categories', Categories());
 break;
      case 2: _navigateToRoute(context, '/Profile', Profile());

    }
  }
  void _navigateToRoute(context,String routeName,Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists =currentRouteName ==routeName;
    if(routeExists) {
      Navigator.popUntil(
          context,
      ModalRoute.withName(routeName)
      );
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => screen,
      settings: RouteSettings(name: routeName),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined,
          color:_selectedIndex ==0? Color(0xff6CC51D): Colors.black  ),label: 'Home' ),
      BottomNavigationBarItem(icon: Icon(Icons.category_outlined,
          color:_selectedIndex ==1? Color(0xff6CC51D): Colors.black  ), label: 'Categories'),
      BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined,
          color:_selectedIndex ==2? Color(0xff6CC51D): Colors.black  ), label: 'Profile'),
    ]);
  }
}
