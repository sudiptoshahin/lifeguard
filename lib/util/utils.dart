import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:lifeguard/pages/aboutus.dart';
import 'package:lifeguard/pages/emergency/emergency.dart';
import 'package:lifeguard/pages/first-aid/firstaid.dart';
import 'package:lifeguard/pages/home.dart';
import 'package:lifeguard/pages/learn/learn.dart';

import '../bottom_navigation_icon_icons.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class Utils {
  BuildContext context;

  Utils(this.context);

  static CurvedNavigationBar appbar(BuildContext context, int index) {
  return CurvedNavigationBar(
    index: index,
    color: Color(0xFF270000),
    backgroundColor: Colors.transparent,
    buttonBackgroundColor: Colors.redAccent,
    animationCurve: Curves.easeInOutCubicEmphasized,
    animationDuration: Duration(milliseconds: 500),
    items: [
      Icon(Icons.home, color: Colors.white, size: 23,),
      Icon(BottomNavigationIcon.first_aid, color: Colors.white, size: 23,),
      Icon(BottomNavigationIcon.emergency, color: Colors.white, size: 23,),
      Icon(Icons.menu_book, color: Colors.white, size: 23,),
      Icon(BottomNavigationIcon.about_us, color: Colors.white, size: 23,),
    ],
    onTap: (index) {
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new Home()));
      }

      if (index == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new FirstAid()));
      }

      if (index == 2) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new Emergency()));
      }

      if (index == 3) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new Learn()));
      }

      if (index == 4) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new AboutUs()));
      }
    },
  );
}

}
