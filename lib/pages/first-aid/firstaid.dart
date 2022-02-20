
import 'package:flutter/material.dart';
import 'package:lifeguard/pages/first-aid/astama.dart';
import 'package:lifeguard/pages/first-aid/bleeding.dart';
import 'package:lifeguard/pages/first-aid/broken_bone.dart';
import 'package:lifeguard/pages/first-aid/burn.dart';
import 'package:lifeguard/pages/first-aid/choking.dart';
import 'package:lifeguard/pages/first-aid/diabetic_emergency.dart';
import 'package:lifeguard/pages/first-aid/distress.dart';
import 'package:lifeguard/pages/first-aid/head_injury.dart';
import 'package:lifeguard/pages/first-aid/heart_attack.dart';
import 'package:lifeguard/pages/first-aid/heat_stroke.dart';
import 'package:lifeguard/pages/first-aid/hypothermia.dart';
import 'package:lifeguard/pages/first-aid/meningitis.dart';
import 'package:lifeguard/pages/first-aid/pfa.dart';
import 'package:lifeguard/pages/first-aid/poisoning_harmful_substance.dart';
import 'package:lifeguard/pages/first-aid/seizure.dart';
import 'package:lifeguard/pages/first-aid/shock.dart';
import 'package:lifeguard/pages/first-aid/sting.dart';
import 'package:lifeguard/pages/first-aid/strains_sprains.dart';
import 'package:lifeguard/pages/first-aid/stroke.dart';
import 'package:lifeguard/pages/first-aid/unconcious_not_breathing.dart';
import 'package:lifeguard/pages/first-aid/unconscious_breathing.dart';
import 'package:lifeguard/util/utils.dart';
import '../home.dart';
import 'allergies.dart';

class FirstAid extends StatelessWidget {

  int _currentIndex = 1;

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
              constraints: BoxConstraints(
                maxHeight: MediaQuery
                    .of(context)
                    .size
                    .height,
              ),
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
                        image: AssetImage('assets/images/firstaid_banner.WEBP'),
                        fit: BoxFit.cover,)
                  ),

                  Container(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text('First Aid', style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 25,
                          color: Color(0xFF270000),
                          fontWeight: FontWeight.bold)),
                  ),

                  //  first aid items
                  Expanded(
                      flex: 3,
                      child: _firstAidItem(context)),

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

  Widget _firstAidItem(BuildContext context) {
    return ListView(
        children: [

          /** allergies **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Allergy()));
                },
                child: ListTile(
                  title: Text('Allergies', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: ExactAssetImage('assets/images/allergy.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** asthma **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Astama()));
                },
                child: ListTile(
                  title: Text('Asthma', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: ExactAssetImage('assets/images/asthma.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** bleeding **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Bleeding()));
                },
                child: ListTile(
                  title: Text('Bleeding', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: ExactAssetImage('assets/images/bleeding.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** broken-bone **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new BrokenBone()));
                },
                child: ListTile(
                  title: Text('Broken bone', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: ExactAssetImage('assets/images/broken_bone.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Burns **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Burn()));
                },
                child: ListTile(
                  title: Text('Burns', style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage('assets/images/burn.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Choking **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Choking()));
                },
                child: ListTile(
                  title: Text('Choking', style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage('assets/images/choking.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Diabetic Emergency **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new DiabeticEmergency()));
                },
                child: ListTile(
                  title: Text('Diabetic Emergency', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: AssetImage('assets/images/diabetc_emergency.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Distress **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Distress()));
                },
                child: ListTile(
                  title: Text('Distress', style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: AssetImage('assets/images/distress.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Heart Attack **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new HeartAttack()));
                },
                child: ListTile(
                  title: Text('Heart Attack', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: AssetImage('assets/images/heart_attack.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Head Injury **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new HeadInjury()));
                },
                child: ListTile(
                  title: Text('Head Injury', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: AssetImage('assets/images/head_injured.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Hypothermia **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new Hypothermia()));
                },
                child: ListTile(
                  title: Text('Hypothermia', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: AssetImage('assets/images/hypothermia.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),


          /** heat stroke **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new HeatStroke()));
                },
                child: ListTile(
                  title: Text('Heat Stroke', style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage('assets/images/heat_stroke.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Meningitis **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new Meningitis()));
                },
                child: ListTile(
                  title: Text('Meningitis', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: AssetImage('assets/images/meningitis.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),


          /** PFA **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new PFA()));
                },
                child: ListTile(
                  title: Text('Psychological first aid', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: ExactAssetImage('assets/images/pfa.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Poisoning or Harmful
              Substances **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new PoisoningHarmfulSubstance()));
                },
                child: ListTile(
                  title: Text('Poisoning or Harmful Substances',
                    style: TextStyle(fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage('assets/images/poison.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Sting or Bites **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new StingBites()));
                },
                child: ListTile(
                  title: Text('Sting or Bites', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage('assets/images/sting.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Seizure or Epilepsy **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Seizure()));
                },
                child: ListTile(
                  title: Text('Seizure or Epilepsy', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(
                    image: AssetImage('assets/images/epilepsy.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Shock **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Shock()));
                },
                child: ListTile(
                  title: Text('Shock', style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage('assets/images/shock.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Stroke **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Stroke()));
                },
                child: ListTile(
                  title: Text('Stroke', style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage('assets/images/stroke.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** strain and sprain **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new StrianSprain()));
                },
                child: ListTile(
                  title: Text('Strain and Sprain', style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage('assets/images/strain_sprain.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Unconscious Breathing **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new UnconsciousBreathing()));
                },
                child: ListTile(
                  title: Text('Unconscious Breathing', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage(
                      'assets/images/unconscious_breathing.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

          /** Unconscious not Breathing **/
          Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new UnconciousNotBreating()));
                },
                child: ListTile(
                  title: Text('Unconscious not Breathing', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),),
                  leading: Image(image: AssetImage(
                      'assets/images/unconscious_not_breathing.png'),
                    height: 30,
                    width: 30,),
                  trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
                ),
              )
          ),

        ]
    );
  }
}