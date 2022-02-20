
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lifeguard/pages/learn/book1.dart';
import 'package:lifeguard/pages/learn/book2.dart';
import 'package:lifeguard/pages/learn/make_first_aid_kit.dart';
import 'package:lifeguard/pages/learn/useful_link1.dart';
import 'package:lifeguard/pages/learn/useful_link2.dart';
import 'package:lifeguard/pages/learn/useful_link3.dart';
import 'package:lifeguard/pages/learn/useful_link4.dart';
import 'package:lifeguard/pages/learn/useful_link5.dart';
import 'package:lifeguard/pages/learn/video_link1.dart';
import 'package:lifeguard/pages/learn/video_link2.dart';
import 'package:lifeguard/pages/learn/video_link3.dart';
import 'package:lifeguard/pages/learn/video_link4.dart';
import 'package:lifeguard/pages/learn/video_link5.dart';
import 'package:lifeguard/util/size_config.dart';
import '../../app_strings.dart';
import '../../util/utils.dart';
import '../home.dart';
class Learn extends StatelessWidget {

  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    print('width: ${SizeConfig.screenWidth}');
    print('height: ${SizeConfig.screenHeight}');

    print('block size horizontal: ${SizeConfig.blockSizeHorizontal}');
    print('block size vertical: ${SizeConfig.blockSizeVertical}');

    print('safe block horizontal: ${SizeConfig.safeBlockHorizontal}');
    print('safe block vertical: ${SizeConfig.safeBlockVertical}');

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    height: 150,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.all(0.0),
                    child: Image(
                      image: AssetImage('assets/images/learn_banner.png'),
                      fit: BoxFit.cover,),
                  ),

                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 5.0),

                    child: Text('Learn', style: AppStrings.heading2Style(),),
                  ),

                  Expanded(
                    child: ListView(
                      children: [

                        /** video links **/
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(bottom: 10),
                          child: Center(
                            child: Text('Video links', style: TextStyle(
                              fontSize: 12,
                                color: Colors.red,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.underline,
                            ),
                            ),
                          ),
                        ),

                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _linkCholesterolButton(context),
                                  _linkDaibetesButton(context),
                                  _linkHypertensionButton(context),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  _linkHeartAttackButton(context),
                                  _linkRespiratoryButton(context),
                                  Padding(padding: EdgeInsets.only(right: 10)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),

                        /** usefull links **/
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Center(
                            child: Text('Useful links', style: TextStyle(fontSize: 12,
                              color: Colors.red,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                            ),
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            usefulLink1(context),
                            usefulLink2(context),
                            usefulLink3(context),
                            usefulLink4(context),
                            usefulLink5(context),
                          ],
                        ),
                        SizedBox(height: 30,),

                        
                        /** extra sections **/
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Center(
                            child: Text('E-Books', style: TextStyle(fontSize: 12,
                              color: Colors.red,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                            ),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _book1(context),
                            _book2(context),
                          ],
                        ),
                        SizedBox(height: 30,),

                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Center(
                            child: Text('Extra', style: TextStyle(fontSize: 12,
                              color: Colors.red,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                            ),
                            ),
                          ),
                        ),

                        makeFirstAid(context),
                        SizedBox(height: 30,),

                      ],
                    ),
                  ),


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


  /** video links **/
  ElevatedButton _linkCholesterolButton(BuildContext context) {

    return ElevatedButton(

      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new VideoLink1()));
      },

      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white30,
      ),
      child: Container(
        width: SizeConfig.safeBlockVertical * 12,
        height: SizeConfig.safeBlockVertical * 12,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.shade300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/images/cholesterol.png',),
              height: SizeConfig.safeBlockVertical * 3.70,
              width: SizeConfig.safeBlockVertical * 3.70,
            ),

            Text('Cholesterol', style: AppStrings.learnMenuTextStyle(2.5),),
          ],
        ),
      ),
    );
  }

  ElevatedButton _linkDaibetesButton(BuildContext context) {

    return ElevatedButton(
      onLongPress: () {},
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new VideoLink2()));
      },

      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white30,
      ),
      child: Container(
        width: SizeConfig.safeBlockVertical * 12,
        height: SizeConfig.safeBlockVertical * 12,

        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.shade300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/images/diabetes.png',),
              height: SizeConfig.safeBlockVertical * 3.70,
              width: SizeConfig.safeBlockVertical * 3.70,
            ),

            Text('Diabetes', style: AppStrings.learnMenuTextStyle(2.5),),
          ],
        ),
      ),
    );
  }

  ElevatedButton _linkHypertensionButton(BuildContext context) {


    return ElevatedButton(
      onLongPress: () {},
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new VideoLink3()));
      },

      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white30,
      ),
      child: Container(
        width: SizeConfig.safeBlockVertical * 12,
        height: SizeConfig.safeBlockVertical * 12,

        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.shade300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/images/hypertension.png',),
              height: SizeConfig.safeBlockVertical * 3.70,
              width: SizeConfig.safeBlockVertical * 3.70,
            ),

            Text('Hypertension', textAlign: TextAlign.center,
              style: AppStrings.learnMenuTextStyle(2.5),),
          ],
        ),
      ),
    );
  }

  ElevatedButton _linkHeartAttackButton(BuildContext context) {

    return ElevatedButton(
      onLongPress: () {},
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new VideoLink4()));
      },

      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white30,
      ),
      child: Container(
        width: SizeConfig.safeBlockVertical * 12,
        height: SizeConfig.safeBlockVertical * 12,

        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.shade300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/images/heart_attack.png',),
              height: SizeConfig.safeBlockVertical * 3.70,
              width: SizeConfig.safeBlockVertical * 3.70,
            ),

            Text('Heart Attack', style: AppStrings.learnMenuTextStyle(2.5),),
          ],
        ),
      ),
    );
  }

  ElevatedButton _linkRespiratoryButton(BuildContext context) {

    return ElevatedButton(
      onLongPress: () {},
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new VideoLink5()));
      },

      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white30,
      ),
      child: Container(
        width: SizeConfig.safeBlockVertical * 12,
        height: SizeConfig.safeBlockVertical * 12,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.shade300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/images/respitory.png',),
              height: SizeConfig.safeBlockVertical * 3.70,
              width: SizeConfig.safeBlockVertical * 3.70,
            ),

            Text('Respiratory\nDisease', textAlign: TextAlign.center,
              style: AppStrings.learnMenuTextStyle(2.5),),
          ],
        ),
      ),
    );
  }

  Widget usefulLink1(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new UsefulLink1()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onSurface: Colors.redAccent.shade100,
      ),
      child: ListTile(
        title: Text(
          'Sri Lanka Red Cross Society', style: AppStrings.usefulLinkStyle(),),
        leading: CircleAvatar(
          child: Image(image: AssetImage('assets/images/link.png'),
            height: 30,
            width: 30,),
          backgroundColor: Colors.redAccent.shade100,
        ),
      ),
    );
  }

  Widget usefulLink2(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new UsefulLink2()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onSurface: Colors.redAccent.shade100,
      ),
      child: ListTile(
        title: Text('International Red Cross and Red Cresecent Movement',
          style: AppStrings.usefulLinkStyle(),),
        leading: CircleAvatar(
          child: Image(image: AssetImage('assets/images/link.png'),
            height: 30,
            width: 30,),
          backgroundColor: Colors.redAccent.shade100,
        ),
      ),
    );
  }

  Widget usefulLink3(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new UsefulLink3()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onSurface: Colors.redAccent.shade100,
      ),
      child: ListTile(
        title: Text(
          'World Health Organization', style: AppStrings.usefulLinkStyle(),),
        leading: CircleAvatar(
          child: Image(image: AssetImage('assets/images/link.png'),
            height: 30,
            width: 30,),
          backgroundColor: Colors.redAccent.shade100,
        ),
      ),
    );
  }

  Widget usefulLink4(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new UsefulLink4()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onSurface: Colors.redAccent.shade100,
      ),
      child: ListTile(
        title: Text('Healthline', style: AppStrings.usefulLinkStyle(),),
        leading: CircleAvatar(
          child: Image(image: AssetImage('assets/images/link.png'),
            height: 30,
            width: 30,),
          backgroundColor: Colors.redAccent.shade100,
        ),
      ),
    );
  }

  Widget usefulLink5(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new UsefulLink5()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onSurface: Colors.redAccent.shade100,
      ),
      child: ListTile(
        title: Text('Centers for Disease Control and Prevention',
          style: AppStrings.usefulLinkStyle(),),
        leading: CircleAvatar(
          child: Image(image: AssetImage('assets/images/link.png'),
            height: 30,
            width: 30,),
          backgroundColor: Colors.redAccent.shade100,
        ),
      ),
    );
  }


  /** books **/
  ElevatedButton _book1(BuildContext context) {
    return ElevatedButton(

      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new Book1()));
      },

      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white30,
      ),
      child: Container(
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.all(5.0),
        width: SizeConfig.safeBlockVertical * 14,
        height: SizeConfig.safeBlockVertical * 14,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white70,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/images/ebook.png',),
              height: 30,
              width: 30,
            ),

            Text('First aid guide', style: AppStrings.learnMenuBookTextStyle(2.5),),
          ],
        ),
      ),
    );
  }

  ElevatedButton _book2(BuildContext context) {
    return ElevatedButton(

      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new Book2()));
      },

      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white30,
      ),
      child: Container(
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.all(5.0),
        width: SizeConfig.safeBlockVertical * 14,
        height: SizeConfig.safeBlockVertical * 14,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white70,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/images/ebook.png',),
              height: 30,
              width: 30,
            ),

            Text('Sports injuries', style: AppStrings.learnMenuBookTextStyle(2.5),),
          ],
        ),
      ),
    );
  }
/** books ends here **/

  Widget makeFirstAid(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new MakeFirstAidKit()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onSurface: Colors.redAccent.shade100,
      ),
      child: ListTile(
        title: Text(
          'How to make first aid kit', style: AppStrings.usefulLinkStyle(),),
        leading: CircleAvatar(
          child: Image(image: AssetImage('assets/images/icon_firstaid.png'),
            height: 20,
            width: 20,),
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }

}
