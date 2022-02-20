
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import 'package:lifeguard/util/utils.dart';
import 'emergency.dart';

class Flood extends StatefulWidget {
  const Flood({Key? key}) : super(key: key);

  @override
  _FloodState createState() => _FloodState();
}

class _FloodState extends State<Flood> {
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
                      child: Image(image: AssetImage('assets/images/flood_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Floods', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: SingleChildScrollView(
                      child: Text(AppStrings.floodsHeadline, style: AppStrings.headlineStyle(),),
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
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

  Entry('Floods may:', <Entry>[
    Entry('Result from rain, snow, coastal storms, storm surges and overflows of dams and other water systems.'),
    Entry('Develop slowly or quickly. Flash floods can come with no warning.'),
    Entry('Cause power outages, disrupt transportation, damage buildings and create landslides.'),
  ]),

  Entry('If you are under a flood warning:', <Entry>[
    Entry('Find safe shelter right away.'),
    Entry('Do not walk, swim or drive through flood waters. Turn Around.'),
    Entry('Remember, just six inches of moving water can knock you down, and one foot of moving water can sweep your vehicle away.'),
    Entry('Stay off bridges over fast-moving water.'),
    Entry('Depending on the type of flooding:', <Entry>[
      Entry('Evacuate if told to do so.'),
      Entry('Move to higher ground or a higher floor.'),
      Entry('Stay where you are.'),
    ]),
  ]),

  Entry('Preparing for a Flood', <Entry>[
    Entry('Make a plan for your household, including your pets, so that you and your family know what to do, where to go, and what you will need to protect yourselves from flooding. Learn and practice evacuation routes, shelter plans, and flash flood response. Gather supplies, including non-perishable foods, cleaning supplies, and water for several days, in case you must leave immediately or if services are cut off in your area.'),
    Entry('Purchase Flood Insurance', <Entry>[
      Entry('Purchase or renew a flood insurance policy. Homeowner’s insurance policies do not cover flooding. It typically takes up to 30 days for a policy to go into effect so the time to buy is well before a disaster.'),
    ]),
    Entry('In Case of Emergency', <Entry>[
      Entry('Keep important documents in a waterproof container. Create password-protected digital copies. Protect your property. Move valuables to higher levels. Declutter drains and gutters. Install check valves. Consider a sump pump with a battery.'),
    ]),
  ]),

  Entry('Staying Safe During a Flood', <Entry>[
    Entry('Evacuate immediately, if told to evacuate. Never drive around barricades. Local responders use them to safely direct traffic out of flooded areas.'),
    Entry('Contact your healthcare provider If you are sick and need medical attention. Wait for further care instructions and shelter in place, if possible. If you are experiencing a medical emergency, call 119 or 1990.'),
    Entry('Listen to Radio or local alerting systems for current emergency information and instructions regarding flooding.'),
    Entry('Do not walk, swim or drive through flood waters. Turn Around.'),
    Entry('Stay off bridges over fast-moving water. Fast-moving water can wash bridges away without warning.'),
    Entry('Stay inside in your if it is trapped in rapidly moving water. Get on the roof if water is rising inside the car.'),
    Entry('Get to the highest level if trapped in a building. Only get on the roof if necessary and once there signal for help. Do not climb into a closed attic to avoid getting trapped by rising floodwater.'),
  ]),

  Entry('Staying Safe After a Flood', <Entry>[
    Entry('Pay attention to authorities for information and instructions. Return home only when authorities say it is safe.'),
    Entry('Avoid driving except in emergencies.'),
    Entry('Wear heavy work gloves, protective clothing and boots during clean up and use appropriate face coverings or masks if cleaning mold or other debris.'),
    Entry('People with asthma and other lung conditions and/or immune suppression should not enter buildings with indoor water leaks or mold growth that can be seen or smelled. Children should not take part in disaster cleanup work.'),
    Entry('Be aware that snakes and other animals may be in your house.'),
    Entry('Be aware of the risk of electrocution. Do not touch electrical equipment if it is wet or if you are standing in water. Turn off the electricity to prevent electric shock if it is safe to do so.'),
    Entry('Avoid wading in floodwater, which can be contaminated and contain dangerous debris.'),
    Entry('Underground or downed power lines can also electrically charge the water.'),
    Entry('Use a generator or other gasoline-powered machinery ONLY outdoors and away from window.'),
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
