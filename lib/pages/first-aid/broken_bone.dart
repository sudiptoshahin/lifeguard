
import 'package:flutter/material.dart';
import '../../app_strings.dart';
import '../../util/utils.dart';
import 'firstaid.dart';

class BrokenBone extends StatelessWidget {
  BrokenBone({Key? key}) : super(key: key);

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
          title: Text(AppStrings.firstAidTitle, style: TextStyle(fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.bold),),
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
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image(image: AssetImage('assets/images/broken_bone_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    child: Text('Broken Bone', style: AppStrings.heading2Style(),),
                  ),


                  Expanded(child: _itemText(context, AppStrings.brokenBoneText),),
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

Widget _itemText(BuildContext context, List<String> item) {
  return ListView.builder(
      itemCount: item.length,
      itemBuilder: (BuildContext context, int index) {
        int currentIndex = index + 1;
        return ListTile(
          leading: CircleAvatar(
            child: Text(currentIndex.toString(), style: AppStrings.listParagraphTitleStyle(),),
            backgroundColor: Color(0xFF270000),
          ),
          title: Text(item[index], style: AppStrings.listParagraphStyle(),),
        );
      }
  );
}

