
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class Pandemic extends StatefulWidget {
  const Pandemic({Key? key}) : super(key: key);

  @override
  _PandemicState createState() => _PandemicState();
}

class _PandemicState extends State<Pandemic> {
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => new Emergency()));
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color(0xFF270000),
          title: Text("Emergency", style: AppStrings.title1Style()),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Emergency()));
          },),
        ),
        body: LayoutBuilder(builder: (context, constraints){
          return  SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Image(image: AssetImage('assets/images/pandemic_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Pandemics', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: SingleChildScrollView(
                      child: Text(AppStrings.pandemicHeadline, style: AppStrings.headlineStyle(),),
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: EntryItem(data[index],),
                            );
                          }
                      ),
                    ),
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

class Entry {
  final String title;
  final List<Entry> children;

  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[

  Entry('If a Pandemic is declared', <Entry>[
    Entry('Wash your hands often with soap and water for at least 20 seconds and try not to touch your eyes, nose or mouth.'),
    Entry('Keep a distance of at least six feet between yourself and people who are not part of your household.'),
    Entry('Cover your mouth and nose with a mask when in public.'),
    Entry('Clean and disinfect high-touch and surfaces.'),
    Entry('Stay at home as much as possible to prevent the spread of disease.')
  ]),

  Entry('How to Prepare Yourself for a Pandemic', <Entry>[
    Entry('Learn how diseases spread', <Entry>[
      Entry('Viruses can be spread from person to person, from a non-living object to a person and by people who are infected but don’t have any symptoms.'),
    ]),
    Entry('Prepare for the possibility of schools, workplaces and community centers being closed.', <Entry>[
      Entry('Investigate and prepare for virtual coordination for school, work (work from home) and social activities.'),
    ]),
    Entry('Gather supplies in case you need to stay home for several days or weeks.', <Entry>[
      Entry('Supplies may include cleaning supplies, non-perishable foods, prescriptions and bottled water. Buy supplies slowly to ensure that everyone has the opportunity to buy what they need.'),
    ]),
    Entry('Create an emergency plan', <Entry>[
      Entry('so that you and your family know what to do and what you will need in case an outbreak happens. Consider how a pandemic may affect your plans for other emergencies.'),
    ]),
  ]),

  Entry('Stay Safe During a Pandemic', <Entry>[
    Entry('Refer to your local and state public health departments for vaccine and testing updates.'),

    Entry('Get vaccinated once available. Vaccines stimulate your immune system to produce antibodies, so vaccines actually prevent diseases.'),

    Entry('Take actions to prevent the spread of disease.', <Entry>[
      Entry('Cover coughs and sneezes. Wear a mask in public. Stay home when sick (except to get medical care). Disinfect surfaces. Wash hands with soap and water for at least 20 seconds. If soap and water are not available, use a hand sanitizer that contains at least 60 percent alcohol. Stay six feet away from people who are not part of your household.')
    ]),

    Entry('If you believe you’ve been exposed to the disease,', <Entry>[
      Entry('Contact your doctor, follow the quarantine instructions from medical providers and monitor your symptoms. If you’re experiencing a medical emergency, call 119 or 110 and shelter in place with a mask, if possible, until help arrives.'),
    ]),

    Entry('Share accurate information about the disease', <Entry>[
      Entry('Sharing bad information about the disease or treatments for the disease may have serious health outcomes. Remember that stigma hurts everyone and can cause discrimination against people, places or nations.'),
    ]),

    Entry('Know that it’s normal to feel anxious or stressed.', <Entry>[
      Entry('Engage virtually with your community through video and phone calls. Take care of your body and talk to someone if you are feeling upset.'),
    ]),
  ]),

  Entry('Stay Safe After a Pandemic', <Entry>[
    Entry('Continue taking protective actions, like:', <Entry>[
      Entry('Staying home when you are sick (except to get medical care).'),
      Entry('Staying home when you are sick (except to get medical care).'),
      Entry('Covering coughs and sneezes with a tissue.'),
      Entry('Washing your hands with soap and water for at least 20 seconds.'),
    ]),

    Entry('Be sure to evaluate your family emergency plan and make timely updates.'),
    Entry('Work with your community to talk about the lessons you learned from the pandemic. Decide how you can use these experiences to be more prepared for future pandemics.'),

  ]),

];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    if(root.children.isEmpty) {
      return ListTile(
        title: Text(root.title, style: AppStrings.expansionListText(),),
        leading: Icon(Icons.arrow_right, color: Colors.redAccent,),
      );
    }

    return ExpansionTile(
      iconColor: Color(0xFF270000),
      childrenPadding: EdgeInsets.all(15.0),
      key: PageStorageKey<Entry>(root),
      title: Text(root.title, style: AppStrings.expansionListTitle(),),
      children: root.children.map<Widget>(_buildTiles).toList(),
      leading: CircleAvatar(
        backgroundColor: Color(0xFF270000),
        child: Text(root.title[0], style: TextStyle(color: Colors.white70),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
