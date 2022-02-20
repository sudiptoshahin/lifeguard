
import 'package:flutter/material.dart';
import 'package:lifeguard/pages/emergency/attacks_in_crowded.dart';
import 'package:lifeguard/pages/emergency/chemical_emergencies.dart';
import 'package:lifeguard/pages/emergency/earthquake.dart';
import 'package:lifeguard/pages/emergency/extreme_heat.dart';
import 'package:lifeguard/pages/emergency/flood.dart';
import 'package:lifeguard/pages/emergency/hazardous_materials_incidents.dart';
import 'package:lifeguard/pages/emergency/landslides.dart';
import 'package:lifeguard/pages/emergency/pandemics.dart';
import 'package:lifeguard/pages/emergency/power_outage.dart';
import 'package:lifeguard/pages/emergency/severe_weather.dart';
import 'package:lifeguard/pages/emergency/thunderstrom_lightning.dart';
import 'package:lifeguard/pages/emergency/tornado.dart';
import 'package:lifeguard/pages/emergency/tsunami.dart';
import 'package:lifeguard/pages/emergency/wildfire.dart';
import 'package:lifeguard/util/utils.dart';
import '../home.dart';

class Emergency extends StatelessWidget {

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new Home()));
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 200,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Image(
                        image: AssetImage('assets/images/emergency_banner.WEBP'),
                        fit: BoxFit.cover,)
                  ),

                  Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Text('Emergency', style: TextStyle(
                            fontFamily: 'Roboto', fontSize: 25, color: Color(
                            0xFF270000), fontWeight: FontWeight.bold)),
                      )
                  ),


                  /***  Emergency items  ***/
                  Expanded(child: _emergencyItem(context),),

                ],
              ),
            ),
          );
        },),

        /** bottom-navigation **/
        bottomNavigationBar: Utils.appbar(context, _currentIndex),
      ),
    );
  }

  Widget _emergencyItem(BuildContext context) {
    return ListView(
      children: [

        /** Attacks in Crowded & Public spaces **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => new AttackInCrowded()));
              },
              child: ListTile(
                title: Text('Attacks in Crowded & Public spaces',
                  style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                leading: Image(image: AssetImage('assets/images/attacks.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Chemical Emergencies **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => new ChemicalEmergency()));
              },
              child: ListTile(
                title: Text('Chemical Emergencies', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(
                  image: AssetImage('assets/images/chemical_emergency.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Earthquakes **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Earthquake()));
              },
              child: ListTile(
                title: Text('Earthquakes', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(
                  image: AssetImage('assets/images/earthquake.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Extreme Heat **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new ExtremeHeat()));
              },
              child: ListTile(
                title: Text('Extreme Heat', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(
                  image: AssetImage('assets/images/extreme_heat.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Floods **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Flood()));
              },
              child: ListTile(
                title: Text('Floods', style: TextStyle(fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(image: AssetImage('assets/images/floods.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Hazardous Materials Incident **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => new HazardousMaterialIncident()));
              },
              child: ListTile(
                title: Text('Hazardous Materials Incident', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(image: AssetImage('assets/images/hazardous.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Landslides & Debris flow **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new LandSlide()));
              },
              child: ListTile(
                title: Text('Landslides & Debris flow', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(
                  image: AssetImage('assets/images/landslides.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Pandemics **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Pandemic()));
              },
              child: ListTile(
                title: Text('Pandemics', style: TextStyle(fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(image: AssetImage('assets/images/pandemics.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Power outages **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new PowerOutage()));
              },
              child: ListTile(
                title: Text('Power Outage', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(
                  image: AssetImage('assets/images/poweroutage.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Severe Weather **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => new SevereWeather()));
              },
              child: ListTile(
                title: Text('Severe Weather', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(image: AssetImage('assets/images/weather.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),


        /** Thunderstorm and Lightning **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Lightning()));
              },
              child: ListTile(
                title: Text('Thunderstorm and Lightning', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(image: AssetImage('assets/images/lightning.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Tornadoes **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Tornado()));
              },
              child: ListTile(
                title: Text('Tornadoes', style: TextStyle(fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(image: AssetImage('assets/images/tornados.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Tsunamis **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Tsunami()));
              },
              child: ListTile(
                title: Text('Tsunamis', style: TextStyle(fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(image: AssetImage('assets/images/tsunami.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

        /** Wildfires **/
        Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new WildFire()));
              },
              child: ListTile(
                title: Text('Wildfires', style: TextStyle(fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),),
                leading: Image(image: AssetImage('assets/images/wildfire.png'),
                  height: 30,
                  width: 30,),
                trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
              ),
            )
        ),

      ],
    );
  }
}