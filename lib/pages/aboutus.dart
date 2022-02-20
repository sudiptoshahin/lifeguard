import 'package:flutter/material.dart';
import '../app_strings.dart';
import '../util/utils.dart';
import 'home.dart';

class AboutUs extends StatelessWidget {
  int _currentIndex = 4;

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
              constraints: BoxConstraints(maxHeight: MediaQuery
                  .of(context)
                  .size
                  .height),
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
                        image: AssetImage('assets/images/org_logo.png'),
                        fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 5.0),

                    child: Text('About us', style: AppStrings.heading2Style(),),
                  ),

                  /** info section starts **/
                  Expanded(
                    // flex: 4,
                    child: ListView(
                      children: [
                        ListTile(
                          leading: Image(image: AssetImage('assets/images/about_what_we_do.png',),height: 35, width: 35,),
                          title: Padding(padding: EdgeInsets.only(top: 5.0, bottom: 10.0), child: Text('What we do?', style: AppStrings.title1Style(),),),
                          subtitle: Text('Our society organizes a blood donation campaign every year since 1978 . We are one of the main school suppliers of blood to the  National Blood Bank of Sri Lanka over the years.'
                          'The project Orange Elephant is done by our society to help impecunious people in difficult villages about the Elephant-human conflict in their areas. We give resources to people for prevention of the conflict.'
                          'Vision is one of the main projects done by the Royal College Red Cross Society. This project is organized not for the benefit of the school alone, but in aid of Sri Lanka Eye Donation Society.', style: AppStrings.headlineStyle(),),
                        ),

                        ListTile(
                          leading: Image(image: AssetImage('assets/images/about_history.png',),height: 35, width: 35,),
                          title: Padding(padding: EdgeInsets.only(top: 5.0, bottom: 5.0), child: Text('History', style: AppStrings.title1Style(),),),
                          subtitle: Text('Founded in 1978, under the guidance of Mr. S.J. Maranthota, (the first Master in Charge) the Royal College Red Cross Society remains to this day as one of the most respected and important clubs of the College, providing a great service to the school and to the community.', style: AppStrings.headlineStyle(),),
                        ),

                        ListTile(
                          leading: Image(image: AssetImage('assets/images/about_our_vision.png',),height: 35, width: 35,),
                          title: Padding(padding: EdgeInsets.only(top: 5.0, bottom: 5.0), child: Text('Our vision', style: AppStrings.title1Style(),),),
                          subtitle: Text('To provide everyone with the highest standard of first aid when required and to serve the community and beyond by conducting community service projects that are designed in line with fundamental principles of International Red Cross and Red Crescent Movement to improve health, safety and quality of life.', style: AppStrings.headlineStyle(),),
                        ),

                        ListTile(
                          leading: Image(image: AssetImage('assets/images/about_our_mission.png',),height: 35, width: 35,),
                          title: Padding(padding: EdgeInsets.only(top: 5.0, bottom: 5.0), child: Text('Our mission', style: AppStrings.title1Style(),),),
                          subtitle: Text('To provide basic first aid and health coverage for events within or outside the college premises when required.'
                              'To continue the Blood Donation Campaign annually, in a successful way.'
                              'To conduct projects in aid of the community within and outside the college premises adhering to the fundamental principles of the International Red Cross and Red Crescent Movement; Humanity, Impartiality, Neutrality, Independence, Voluntary Service, Unity and Universality.', style: AppStrings.headlineStyle(),),
                        ),
                      ],
                    ),
                  ),
                  /** info section ends **/


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