
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import 'package:lifeguard/util/size_config.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class Lightning extends StatefulWidget {
  const Lightning({Key? key}) : super(key: key);

  @override
  _LightningState createState() => _LightningState();
}

class _LightningState extends State<Lightning> {

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
                      child: Image(image: AssetImage('assets/images/thunderstrom_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Thunderstorm or Lightning', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: SizeConfig.safeBlockVertical * 20,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: Text(AppStrings.thurnderstromHeadline, style: AppStrings.headlineStyle(),),
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
    'Thunderstorms are dangerous storms that include lightning and can:', <Entry>[
    Entry('Include powerful winds over 50 MPH',),
    Entry('Create hail; and',),
    Entry('Cause flash flooding and tornadoes.'),
  ],
  ),

  Entry('If you are under a Thunderstorm or Lightning:', <Entry>[
    Entry('When thunder roars, go indoors!'),
    Entry('Move from outdoors into a building or car.'),
    Entry('Pay attention to alerts and warnings.'),
    Entry('Unplug appliances.'),
    Entry('Do not use landline phones.',),
  ]),

  Entry(
    'Prepare for Thunderstorm',
    <Entry>[
      Entry('Know your area’s risk for thunderstorms. In most places, they can occur year-round and at any hour.',),
      Entry('Create an emergency plan so that you and your family know what to do, where to go, and what you will need to protect yourselves from the effects of a thunderstorm',),
      Entry('Identify nearby, sturdy buildings close to where you live, work, study, and play.'),
      Entry('Cut down or trim trees that may be in danger of falling on your home.'),
      Entry('Consider buying surge protectors, lightning rods, or a lightning protection system to protect your home, appliances, and electronic devices.'),
    ],
  ),

  //  survive during
  Entry('Survive during', <Entry>[
    Entry('When thunder roars, go indoors. A sturdy building is the safest place to be during a thunderstorm.'),
    Entry('Pay attention to weather reports and warnings of thunderstorms. Be ready to change plans, if necessary, to be near shelter.'),
    Entry('When you receive a thunderstorm warning or hear thunder, go inside immediately.'),
    Entry('If indoors, avoid running water or using landline phones. Electricity can travel through plumbing and phone lines.'),
    Entry('Protect your property. Unplug appliances and other electric devices. Secure outside furniture.'),
    Entry('If boating or swimming, get to land and find a sturdy, grounded shelter or vehicle immediately.'),
    Entry('If necessary, take shelter in a car with a metal top and sides. Do not touch anything metal. Avoid touching your eyes, nose, and mouth.'),
    Entry('Avoid flooded roadways. Turn Around. Don’t Drown! Just six inches of fast-moving water can knock you down, and one foot of moving water can sweep your vehicle away.'),
  ]),

  //  Be safe after
  Entry('Be safe after', <Entry>[
    Entry('Listen to authorities and weather forecasts for information on whether it is safe to go outside and instructions regarding potential flash flooding.'),
    Entry('Watch for fallen power lines and trees. Report them immediately.'),
    Entry('If you are sick and need medical attention, contact your healthcare provider for further care instructions and shelter in place, if possible.'),
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