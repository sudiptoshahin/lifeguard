import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifeguard/pages/aboutus.dart';
import 'package:lifeguard/pages/emergency_contact.dart';
import 'package:lifeguard/util/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'emergency/emergency.dart';
import 'first-aid/firstaid.dart';
import 'learn/learn.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.red,
      border: Border.all(style: BorderStyle.none),
      // borderRadius: BorderRadius.circular(80.0),
      shape: BoxShape.circle,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66FFFFFF),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 3.0),
        )
      ],
    ),



    end: BoxDecoration(
      shape: BoxShape.circle,
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        style: BorderStyle.none,
      ),

      // No shadow.
    ),
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: WillPopScope(
          onWillPop: (){
            Future.delayed(const Duration(milliseconds: 700), () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              exit(0);
            });
            return Future.value(false);
          },
          child: Scaffold(
            backgroundColor: Color(0xFFEFF2FA),
            extendBody: true,
            body: LayoutBuilder(builder: (context, constraints){

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  // color: Colors.greenAccent,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        // app logo and name
                        Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockHorizontal * 10,
                          // color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              appLogo(SizeConfig.safeBlockVertical * 15, SizeConfig.safeBlockHorizontal * 15),
                              // SizedBox(width: 3,),
                              appNameText()
                            ],
                          ),
                        ),
                        /** end of app logo name **/

                        /** emergency button text1 start **/
                        Container(
                          // color: Colors.blueAccent,
                          margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 5),
                          child: Text("Emergency help needed?", style: TextStyle(
                            color: Color(0xFF270000), fontFamily: 'Montserrat', fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                            textAlign: TextAlign.center,),
                        ),
                        /** emergency button text1 end **/

                        /** emergency button text2 starts **/
                        Container(
                          // color: Colors.black26,
                          margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 3),
                          padding: EdgeInsets.all(5.0),
                          child: Center(
                            child: Text("Hold the button for an emergency call", textAlign: TextAlign.center, style: TextStyle(
                                color: Colors.red, fontFamily: 'Lato', fontWeight: FontWeight.bold,
                                fontSize: 14
                            )),
                          ),
                        ),
                        /** emergency button text2 end **/


                        /** emergency button starts **/
                        Container(
                          // color: Colors.white70,
                          height: SizeConfig.safeBlockVertical * 28,
                          width: SizeConfig.safeBlockVertical * 28,
                          child: FlatButton(
                            onLongPress: (){
                              launch('tel:119');
                            },
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new EmergencyContact()));
                            },
                            child: RiveAnimation.asset('assets/animations/bouncing.riv'),
                          ),
                        ),
                        /** emergency button ends **/

                        /** emergency button text3 starts **/
                        Container(
                          // color: Colors.blueAccent,
                          margin: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 5),
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Text("Tap the button for more emergency contacts",textAlign: TextAlign.center, style: TextStyle(
                                color: Color(0xFF270000), fontFamily: 'Lato', fontWeight: FontWeight.bold,
                                fontSize: 14
                            )),
                          ),
                        ),
                        /** emergency button text3 ends **/

                        /** lifeguard app main menu starts **/
                        Container(
                          // color: Colors.yellowAccent,
                          height: SizeConfig.safeBlockVertical * 29,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  menu1FirstAid(context),
                                  menu2Emergency(context)
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 15.0),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  menu4Learn(context),
                                  menu3AboutUs(context),
                                ],
                              ),
                            ],
                          ),
                        ),
                        /** lifeguard app main menu ends **/






                      ],
                    ),
                  ),
                ),
              );
            },),
          ),
        ),
      )
    );
  }
}

Image appLogo(double resHeight, double resWidth) {
  return Image(
    image: AssetImage('assets/images/life_guard_logo.png'),
    height: resHeight,
    width: resWidth,
  );
}

Text appNameText() {
  return Text('LifeGuard',
    style: TextStyle(color: Color(0xFF270000),
        fontSize: 28, fontFamily: 'Montserrat',
        fontWeight: FontWeight.w800),);
}


Widget menu1FirstAid(BuildContext context) {
  return PhysicalModel(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30.0),
    shadowColor: Colors.black,
    shape: BoxShape.rectangle,
    elevation: 10.0,
    child: Container(
      height: SizeConfig.safeBlockVertical * 11,
      width: SizeConfig.safeBlockVertical * 16.8,
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => new FirstAid()));
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.all(5.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/icon_firstaid.png',), height: SizeConfig.safeBlockVertical * 4.30, width: SizeConfig.safeBlockVertical * 4.30,),
            Padding(padding: EdgeInsets.only(top: 10),),
            Text('First aid',
              style: TextStyle(fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),),
          ],
        ),
      ),
    ),
  );
}

Widget menu2Emergency(BuildContext context) {
  return PhysicalModel(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30.0),
    shadowColor: Colors.black,
    shape: BoxShape.rectangle,
    elevation: 10.0,
    child: Container(
      height: SizeConfig.safeBlockVertical * 11,
      width: SizeConfig.safeBlockVertical * 16.8,
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => new Emergency()));
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          padding: EdgeInsets.all(5.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/icon_emergency.png',), height: SizeConfig.safeBlockVertical * 4.30, width: SizeConfig.safeBlockVertical * 4.30,),
            Padding(padding: EdgeInsets.only(top: 10),),
            Text('Emergency',
              style: TextStyle(fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),),
          ],
        ),
      ),
    ),
  );
}

Widget menu3AboutUs(BuildContext context) {
  return PhysicalModel(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30.0),
    shadowColor: Colors.black,
    shape: BoxShape.rectangle,
    elevation: 10.0,
    child: Container(
      height: SizeConfig.safeBlockVertical * 11,
      width: SizeConfig.safeBlockVertical * 16.8,
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => new AboutUs()));
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.all(5.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/icon_aboutus.png',), height: SizeConfig.safeBlockVertical * 4.30, width: SizeConfig.safeBlockVertical * 4.30,),
            Padding(padding: EdgeInsets.only(top: 10),),
            Text('About us',
              style: TextStyle(fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),),
          ],
        ),
      ),
    ),
  );
}

Widget menu4Learn(BuildContext context) {
  return PhysicalModel(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30.0),
    shadowColor: Colors.black,
    shape: BoxShape.rectangle,
    elevation: 10.0,
    child: Container(
      height: SizeConfig.safeBlockVertical * 11,
      width: SizeConfig.safeBlockVertical * 16.8,
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => new Learn()));
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          padding: EdgeInsets.all(5.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/icon_learn.png',), height: SizeConfig.safeBlockVertical * 4.30, width: SizeConfig.safeBlockVertical * 4.30,),
            Padding(padding: EdgeInsets.only(top: 10),),
            Text('Learn',
              style: TextStyle(fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),),
          ],
        ),
      ),
    ),
  );
}
