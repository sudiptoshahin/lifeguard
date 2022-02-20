
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import 'package:lifeguard/pages/first-aid/sting_animals.dart';
import 'package:lifeguard/pages/first-aid/sting_insect.dart';
import 'package:lifeguard/pages/first-aid/sting_jellyfish.dart';
import 'package:lifeguard/pages/first-aid/sting_scorpion.dart';
import 'package:lifeguard/pages/first-aid/sting_snake.dart';
import 'package:lifeguard/pages/first-aid/sting_tick.dart';
import '../../util/utils.dart';
import 'firstaid.dart';

class StingBites extends StatefulWidget {
  const StingBites({Key? key}) : super(key: key);

  @override
  _StingBitesState createState() => _StingBitesState();
}

class _StingBitesState extends State<StingBites> {

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
          title: Text(AppStrings.stingbites_title, style: TextStyle(fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.bold),),
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

                  /**
                   * body starts here***/

                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 15.0),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(5.0),
                    child: Text(AppStrings.stingbites_headline, style: AppStrings.headlineStyle(),),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFF270000),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(AppStrings.stingbites_related_title, style: AppStrings.headingStyle(),),
                  ),


                  Expanded(child: _relatedFirstAid(context),),
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

Widget _relatedFirstAid(BuildContext context) {
  return ListView(
    children: [

      /** sting animals **/
      Card(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white70,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new StingAnimal()));
            },
            child:  ListTile(
              title: Text(AppStrings.stingbites_related_item6_title, style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.bold),),
              leading: Image(image: AssetImage('assets/images/animals.png'), height: 30, width: 30,),
              trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
            ),
          )
      ),

      /** insects sting **/
      Card(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white70,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new StingInsect()));
            },
            child:  ListTile(
              title: Text(AppStrings.stingbites_related_item1_title, style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.bold),),
              leading: Image(image: AssetImage('assets/images/insects.png'), height: 30, width: 30,),
              trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
            ),
          )
      ),

      /** tick **/
      Card(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white70,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new StingTick()));
            },
            child:  ListTile(
              title: Text(AppStrings.stingbites_related_item2_title, style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.bold),),
              leading: Image(image: AssetImage('assets/images/tick.png'), height: 30, width: 30,),
              trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
            ),
          )
      ),

      /** Scorpions or Spider **/
      Card(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white70,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new StingScorpion()));
            },
            child:  ListTile(
              title: Text(AppStrings.stingbites_related_item3_title, style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.bold),),
              leading: Image(image: AssetImage('assets/images/scorpion.png'), height: 30, width: 30,),
              trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
            ),
          )
      ),

      /** Jellyfish**/
      Card(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white70,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new StingJellyFish()));
            },
            child:  ListTile(
              title: Text(AppStrings.stingbites_related_item4_title, style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.bold),),
              leading: Image(image: AssetImage('assets/images/jellyfish.png'), height: 30, width: 30,),
              trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
            ),
          )
      ),

      /** snakes **/
      Card(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white70,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new StingSnake()));
            },
            child:  ListTile(
              title: Text(AppStrings.stingbites_related_item5_title, style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.bold),),
              leading: Image(image: AssetImage('assets/images/snakes.png'), height: 30, width: 30,),
              trailing: Icon(Icons.arrow_right, color: Color(0xFF270000),),
            ),
          )
      ),
    ],
  );
}
