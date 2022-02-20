
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class Tornado extends StatefulWidget {
  const Tornado({Key? key}) : super(key: key);

  @override
  _TornadoState createState() => _TornadoState();
}

class _TornadoState extends State<Tornado> {
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
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Image(image: AssetImage('assets/images/tornado_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Tornados', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: Text(AppStrings.tornadoHeadline, style: AppStrings.headlineStyle(),),
                  ),

                  Expanded(child: ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
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
    'A Tornado can', <Entry>[
      Entry('Happen anytime and anywhere.',),
      Entry('Bring intense winds, over 200 miles per hour.',),
      Entry('Look like funnels.',),
  ],
  ),

  Entry('If you are under a tornado or severe weather warning:', <Entry>[
    Entry('Follow the instructions of state, local and tribal officials.'),
    Entry('Go to a safe shelter immediately, such as a safe room, basement, storm cellar or a small interior room on the lowest level of a sturdy building.'),
    Entry('Stay away from windows, doors, and outside walls.'),
    Entry('Do not go under an overpass or bridge. You’re safer in a low, flat location.'),
    Entry('Watch out for flying debris that can cause injury or death.'),
    Entry('Use your arms to protect your head and neck.'),
  ]),

  Entry(
    'Prepare for a tornado',
    <Entry>[
      Entry(
        'Know your area’s tornado risk.',),

      Entry('Know the signs of a tornado', <Entry>[
        Entry('including a rotating'),
        Entry('funnel-shaped cloud, an approaching cloud of debris or a loud roar like a freight train'),
        Entry('If your community has sirens, then become familiar with the warning tone.'),
      ]),

      Entry('Pay attention to weather reports.', <Entry>[
        Entry('Meteorologists can predict when conditions might be right for a tornado.'),
      ]),

      Entry('Identify and practice going to a safe shelter ', <Entry>[
        Entry('such as a storm shelter built to ICC 500 standards.'),
        Entry('The next best protection is a small, interior, windowless room or basement on the lowest level of a sturdy building.'),

      ]),

      Entry('Plan for your pet. They are an important member of your family, so they need to be included in your family’s emergency plan.'),

      Entry('Prepare for long-term stay at home or sheltering in place by gathering emergency supplies, cleaning supplies, non-perishable foods, water, medical supplies and medication.')

    ],
  ),

  //  stay safe during a tornado
  Entry('Staying Safe During a Tornado', <Entry>[
    Entry('Immediately go to a safe location that you have identified.'),
    Entry('Pay attention to Radio, or local alerting systems for current emergency information and instructions.'),
    Entry('Protect yourself by covering your head or neck with your arms and putting materials such as furniture and blankets around or on top of you.'),
    Entry('Do not try to outrun a tornado in a vehicle if you are in a car. If you are in a car or outdoors and cannot get to a building, cover your head and neck with your arms and cover your body with a coat or blanket, if possible.'),
  ]),

  //  returning home
  Entry('Staying Safe After a Tornado', <Entry>[
    Entry('Save your phone calls for emergencies and use text messaging or social '
        'media to communicate with family and friends.', <Entry>[
          Entry('Pay attention to Radio, and local authorities for updated information.'),
          Entry('Stay clear of fallen power lines or broken utility lines.'),
          Entry('Contact your healthcare provider if you are sick and need medical attention. Wait for further care instructions and continue to shelter in place.'),
          Entry('Wear appropriate gear during clean-up such as thick-soled shoes, long pants, and work gloves'),
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

