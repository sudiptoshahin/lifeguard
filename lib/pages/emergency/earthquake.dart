
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class Earthquake extends StatefulWidget {
  const Earthquake({Key? key}) : super(key: key);

  @override
  _EarthquakeState createState() => _EarthquakeState();
}

class _EarthquakeState extends State<Earthquake> {
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
                      child: Image(image: AssetImage('assets/images/earthquake_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Earthquakes', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: SingleChildScrollView(
                      child: Text(AppStrings.earthquakeHeadline, style: AppStrings.headlineStyle(),),
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 300,
                      padding: EdgeInsets.only(bottom: 10.0),
                      margin: EdgeInsets.only(bottom: 50.0),
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

  Entry('Prepare Before an Earthquake', <Entry>[
    Entry('The best time to prepare for any disaster is before it happens.', <Entry>[
      Entry('Practice Drop, Cover, and Hold On with family and coworkers.'),
      Entry('Make an Plan:', <Entry>[
        Entry('Create a family emergency communications plan that has an out-of-state contact.'
            ' Plan where to meet if you get separated. Make a supply kit that includes enough '
            'food and water for several days, a flashlight, a fire extinguisher and a whistle.', <Entry>[
              Entry('Include non-perishable foods, cleaning supplies, and water for several days, in case services are cut off in your area. If you are able to, set aside items like soap, hand sanitizer that contains at least 60 percent alcohol, disinfecting wipes, and general household cleaning supplies that you can use to disinfect surfaces you touch regularly. After an earthquake, you may not have access to these supplies for days or even weeks.'),
              Entry('Being prepared allows you to avoid unnecessary excursions and to address minor medical issues at home, alleviating the burden on urgent care centers and hospitals.'),
              Entry('Remember that not everyone can afford to respond by stocking up on necessities. For those who can afford it, making essential purchases and slowly building up supplies in advance will allow for longer time periods between shopping trips. This helps to protect those who are unable to procure essentials in advance of the pandemic and must shop more frequently.'),
        ]),

      ]),
      Entry('Protect Your Home:', <Entry>[
        Entry('Secure heavy items in your home like bookcases, refrigerators, televisions and objects that hang on walls. Store heavy and breakable objects on low shelves. Consider making improvements to your building to fix structural issues that could cause your building to collapse during an earthquake. Consider obtaining an earthquake insurance policy. A standard homeowner’s insurance policy does not cover earthquake damage.'),
      ]),
    ]),
  ]),
  Entry('Stay Safe During', <Entry>[
    Entry('If an earthquake happens, protect yourself right away:', <Entry>[
      Entry('If you are in a car, pull over and stop. Set your parking brake.'),
      Entry('If you are in bed, turn face down and cover your head and neck with a pillow.'),
      Entry('If you are outdoors, stay outdoors away from buildings.'),
      Entry('If you are inside, stay and do not run outside and avoid doorways.'),
    ]),
    Entry('Protect Yourself During Earthquakes', <Entry>[
      Entry('Drop (or Lock)', <Entry>[
        Entry('Wherever you are, drop down to your hands and knees and hold onto something sturdy. If you’re using a wheelchair or walker with a seat, make sure your wheels are locked and remain seated until the shaking stops.'),
      ]),
      Entry('Cover', <Entry>[
        Entry('Cover your head and neck with your arms. If a sturdy table or desk is nearby, crawl underneath it for shelter. If no shelter is nearby, crawl next to an interior wall (away from windows). Crawl only if you can reach better cover without going through an area with more debris. Stay on your knees or bent over to protect vital organs.'),
      ]),
      Entry('Hold On', <Entry>[
        Entry('If you are under a table or desk, hold on with one hand and be ready to move with it if it moves. If seated and unable to drop to the floor, bend forward, cover your head with your arms and hold on to your neck with both hands.'),
      ]),
    ]),
  ]),

  Entry('Stay Safe After', <Entry>[

    Entry('After an earthquake, there can be serious hazards such as damage to the building, leaking gas and water lines, or downed power lines.', <Entry>[
      Entry('Wash your hands with soap and water after holding on to commonly touched surfaces or objects. If you are unable to wash your hands, use hand sanitizer that contains at least 60 percent alcohol.'),
      Entry('Expect aftershocks to follow the main shock of an earthquake. Be ready to Drop, Cover, and Hold On if you feel an aftershock.'),
      Entry('If you are in a damaged building, go outside and quickly move away from the building. Do not enter damaged buildings.'),
      Entry('If you are trapped, send a text or bang on a pipe or wall. Cover your mouth with your shirt for protection and instead of shouting, use a whistle.'),
      Entry('If you are in an area that may experience tsunamis, go inland or to higher ground immediately after the shaking stops.'),
      Entry('Check yourself to see if you are hurt and help others if you have training.', <Entry>[
        Entry('If you are sick or injured and need medical attention, contact your healthcare provider for instructions. If you are experiencing a medical emergency, call 119 and let the operator know.'),
      ]),
    ]),

    Entry('Once you are safe, pay attention to local news reports for emergency information and instructions via battery-operated radio, TV, social media or from cell phone text alerts.', <Entry>[
      Entry('Use text messages to communicate, which may be more reliable than phone calls.'),
      Entry('Be careful when cleaning up. Wear protective clothing, including a long-sleeved shirt, long pants, work gloves and sturdy thick-soled shoes. Do not try to remove heavy debris by yourself. Wear a mask and maintain a physical distance of at least six feet while working with someone else. Use an appropriate mask if cleaning mold or other debris. People with asthma and other lung conditions and/or immune suppression should not enter buildings with indoor water leaks or mold growth that can be seen or smelled. Children should not take part in disaster cleanup work.'),
      Entry('Engage virtually with your community through video and phone calls. Know that it\'s normal to feel anxious or stressed. Take care of your body and talk to someone if you are feeling upset.'),
    ]),
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