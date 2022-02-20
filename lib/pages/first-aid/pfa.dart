

import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'firstaid.dart';

class PFA extends StatefulWidget {
  const PFA({Key? key}) : super(key: key);

  @override
  _PFAState createState() => _PFAState();
}

class _PFAState extends State<PFA> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => new FirstAid()));
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color(0xFF270000),
          title: Text(AppStrings.firstAidTitle, style: AppStrings.title1Style()),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => new FirstAid()));
          },),
        ),
        body: LayoutBuilder(builder: (context, constraints){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Image(image: AssetImage('assets/images/pfa_banner.jpg'), fit: BoxFit.fitWidth,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    child: Text('Psychological First Aid', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 120,
                    margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0, bottom: 10.0),
                        child: Text(AppStrings.pfa_headline, style: AppStrings.headlineStyle(),),
                      )
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only( bottom: 10),
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFF270000),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text('Four basic elements of PFA', style: AppStrings.headingStyle(),),
                  ),


                  Expanded(
                    flex: 1,
                    child: _fourBasicElements(context),
                  ),

                  SizedBox(height: 100,),

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
}

Widget _fourBasicElements(BuildContext context) {
  return ListView(
    children: [
      ListTile(
        leading: CircleAvatar(
          child: Text('1', style: AppStrings.listParagraphTitleStyle(),),
          backgroundColor: Color(0xFF270000),
          ),
        title: Text(AppStrings.pfa_basic_element1_title, style: AppStrings.listParagraphTitleStyle(),),
        subtitle: Text(AppStrings.pfa_basic_element1_subtitle, style: AppStrings.listParagraphStyle(),),
      ),

      ListTile(
        leading: CircleAvatar(
          child: Text('2', style: AppStrings.listParagraphTitleStyle(),),
          backgroundColor: Color(0xFF270000),
        ),
        title: Text(AppStrings.pfa_basic_element2_title, style: AppStrings.listParagraphTitleStyle(),),
        subtitle: Text(AppStrings.pfa_basic_element2_subtitle, style: AppStrings.listParagraphStyle(),),
      ),

      ListTile(
        leading: CircleAvatar(
          child: Text('3', style: AppStrings.listParagraphTitleStyle(),),
          backgroundColor: Color(0xFF270000),
        ),
        title: Text(AppStrings.pfa_basic_element3_title, style: AppStrings.listParagraphTitleStyle(),),
        subtitle: Text(AppStrings.pfa_basic_element3_subtitle, style: AppStrings.listParagraphStyle(),),
      ),

      ListTile(
        leading: CircleAvatar(
          child: Text('4', style: AppStrings.listParagraphTitleStyle(),),
          backgroundColor: Color(0xFF270000),
        ),
        title: Text(AppStrings.pfa_basic_element4_title, style: AppStrings.listParagraphTitleStyle(),),
        subtitle: Text(AppStrings.pfa_basic_element4_subtitle, style: AppStrings.listParagraphStyle(),),
      ),
    ],
  );
}
