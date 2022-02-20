
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import 'package:lifeguard/util/size_config.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class Tsunami extends StatefulWidget {
  const Tsunami({Key? key}) : super(key: key);

  @override
  _TsunamiState createState() => _TsunamiState();
}

class _TsunamiState extends State<Tsunami> {
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
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Image(image: AssetImage('assets/images/tsunami_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Tsunamis', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: SizeConfig.safeBlockVertical * 20,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: Text(AppStrings.tsunamiHeadline, style: AppStrings.headlineStyle(),),
                  ),

                  Expanded(child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: EntryItem(data[index],),
                        );
                      }
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
  //  make emergency plan
  Entry(
    'Tsunamis can', <Entry>[
    Entry('Travel 30-50 kilometer per hour with waves 10-100 feet high.',),
    Entry('Cause flooding and disrupt transportation, power, communications, and the water supply.',),
  ],
  ),

  Entry('If you are under a tsunami warning:', <Entry>[
    Entry('First, protect yourself from an Earthquake. Drop, Cover, then Hold On.'),
    Entry('Get to high ground as far inland as possible. Protect yourself from the effects of a tsunami by moving from the shore to safe, high grounds outside tsunami hazard areas.'),
    Entry('Be alert to signs of a tsunami, such as a sudden rise or draining of ocean waters.'),
    Entry('Listen to emergency information and alerts..'),
    Entry('Evacuate: DO NOT wait! Leave as soon as you see any natural signs'
        ' of a tsunami or receive an official tsunami warning.', <Entry>[
          Entry('Always follow the instructions from local emergency managers. They provide the latest recommendations based on the threat in your community.'),
          Entry('Make plans to shelter with friends and family, if possible.'),
    ]),
  ]),

  Entry(
    'Prepare for a Tsunami',
    <Entry>[
      Entry('If you live near, or regularly visit a coastal area, learn about the risk of tsunami in the area. Some at-risk communities have maps with evacuation zones and routes. If you are a visitor, ask about community plans.',),

      Entry('Learn the signs of a potential tsunami, such as an earthquake, a loud roar from the ocean, or unusual ocean behavior, such as a sudden rise or wall of water or sudden draining of water showing the ocean floor.',),
      Entry('Learn the signs of a potential tsunami, such as an earthquake, a loud roar from the ocean, or unusual ocean behavior, such as a sudden rise or wall of water or sudden draining of water showing the ocean floor.'),
      Entry('Know and practice community evacuation plans and map out your routes from home, work, and play. Pick shelters 100 feet or more above sea level, or at least one mile inland.'),
      Entry('Create a family emergency communication plan that has an out-of-state contact. Plan where to meet if you get separated.'),
    ],
  ),

  //  survive during
  Entry('Survive during', <Entry>[
    Entry('If you are in a tsunami area and there is an earthquake, then first protect yourself from the earthquake. Drop, Cover, and Hold On. Drop to your hands and knees. Cover your head and neck with your arms. Hold on to any sturdy furniture until the shaking stops. Crawl only if you can reach better cover, but do not go through an area with more debris.'),
    Entry('When the shaking stops, if there are natural signs or official warnings of a tsunami, then move immediately to a safe place. Listen to the authorities, but do not wait for tsunami warnings and evacuation orders.'),
    Entry('If you are outside of the tsunami hazard zone and receive a warning, then stay where you are unless officials tell you otherwise.'),
    Entry('Leave immediately if you are told to do so. Evacuation routes are often marked by a wave with an arrow in the direction of higher ground.'),
    Entry('If you are in the water, then grab onto something that floats, such as a raft, tree trunk, or door.'),
    Entry('If you are in a boat, then face the direction of the waves and head out to sea. If you are in a harbor, then go inland.')
  ]),

  //  Be safe after
  Entry('Be safe after', <Entry>[
    Entry('Listen to local alerts and authorities for information on areas to avoid and shelter locations.'),
    Entry('Avoid wading in floodwater, which can contain dangerous debris. Water may be deeper than it appears.'),
    Entry('Be aware of the risk of electrocution. Underground or downed power lines can electrically charge water. Do not touch electrical equipment if it is wet or if you are standing in water.'),
    Entry('If you become injured or sick and need medical attention, contact your healthcare provider for further care instructions and shelter in place, if possible. If you are experiencing a medical emergency, call 1-1-9. If possible, put on a mask before help arrives. If staying at a shelter or public facility, alert shelter staff immediately so they can call a local hospital or clinic.'),
    Entry('Stay away from damaged buildings, roads, and bridges.'),
    Entry('Document property damage with photographs. Conduct an inventory and contact your insurance company for assistance.'),
    Entry('Save phone calls for emergencies. Phone systems are often down or busy after a disaster. Use text messages or social media to communicate with family and friends.'),
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
