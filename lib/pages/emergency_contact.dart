
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import 'package:lifeguard/pages/home.dart';
import 'package:lifeguard/pages/learn/learn.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../bottom_navigation_icon_icons.dart';
import '../util/utils.dart';
import 'aboutus.dart';
import 'emergency/emergency.dart';
import 'first-aid/firstaid.dart';

class EmergencyContact extends StatelessWidget {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => new Home()));
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color(0xFF270000),
          title: Text("Get emergency help", style: AppStrings.title1Style()),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Home()));
          },),
        ),
        body:  LayoutBuilder(builder: (context, constraints){
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image(image: AssetImage('assets/images/emergency_contact_banner.jpg'), fit: BoxFit.fitWidth,)
                ),

                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text('Emergency contacts', style: TextStyle(fontFamily: 'Roboto', fontSize: 25, color: Color(0xFF270000), fontWeight: FontWeight.bold)),
                    )
                ),

                SizedBox(height: 30,),
                Expanded(
                  flex: 3,
                  child: ListView(
                    children: [
                      emergencyContact1(),
                      emergencyContact2(),
                      emergencyContact3(),
                      emergencyContact4(),
                      emergencyContact5(),
                    ],
                  ),
                ),

              ],
            ),
          );
        },),

        /** bottom-navigation **/
        bottomNavigationBar: Utils.appbar(context, _currentIndex),
      ),
    );
  }
}

Widget emergencyContact1() {
  return ElevatedButton(
    onPressed: (){
      launch('tel:119');
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      onSurface: Colors.redAccent.shade100,
    ),
    child: ListTile(
      title: Text('Police Emergency Hotline', style: AppStrings.emergencyContactTitle(),),
      leading: Icon(Icons.local_police_rounded, color: Colors.redAccent, size: 30,),
      trailing: CircleAvatar(
        child: Icon(Icons.call, size: 20, color: Colors.white,),
        backgroundColor: Color(0xFF270000),
      ),
    ),
  );
}

Widget emergencyContact2() {
  return ElevatedButton(
    onPressed: (){
      launch('tel:110');
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      onSurface: Colors.redAccent.shade100,
    ),
    child: ListTile(
      title: Text('Ambulance / Fire & rescue', style: AppStrings.emergencyContactTitle(),),
      leading: Icon(Icons.fireplace_outlined, color: Colors.redAccent, size: 30,),
      trailing: CircleAvatar(
        child: Icon(Icons.call, size: 20, color: Colors.white,),
        backgroundColor: Color(0xFF270000),
      ),
    ),
  );
}

Widget emergencyContact3() {
  return ElevatedButton(
    onPressed: (){
      launch('tel:117');
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      onSurface: Colors.redAccent.shade100,
    ),
    child: ListTile(
      title: Text('Disaster Management Call Centre', style: AppStrings.emergencyContactTitle(),),
      leading: Icon(Icons.cloud_circle, color: Colors.redAccent, size: 30,),
      trailing: CircleAvatar(
        child: Icon(Icons.call, size: 20, color: Colors.white,),
        backgroundColor: Color(0xFF270000),
      ),
    ),
  );
}

Widget emergencyContact4() {
  return ElevatedButton(
    onPressed: (){
      launch('tel:011-2433335');
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      onSurface: Colors.redAccent.shade100,
    ),
    child: ListTile(
      title: Text('Bomb Disposal', style: AppStrings.emergencyContactTitle(),),
      leading: Icon(Icons.dangerous, color: Colors.redAccent, size: 30,),
      trailing: CircleAvatar(
        child: Icon(Icons.call, size: 20, color: Colors.white,),
        backgroundColor: Color(0xFF270000),
      ),
    ),
  );
}

Widget emergencyContact5() {
  return ElevatedButton(
    onPressed: (){
      launch('tel:1990');
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      onSurface: Colors.redAccent.shade100,
    ),
    child: ListTile(
      title: Text('Suwa Seriya Ambulance', style: AppStrings.emergencyContactTitle(),),
      leading: Icon(Icons.car_repair, color: Colors.redAccent, size: 30,),
      trailing: CircleAvatar(
        child: Icon(Icons.call, size: 20, color: Colors.white,),
        backgroundColor: Color(0xFF270000),
      ),
    ),
  );
}