
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class PowerOutage extends StatefulWidget {
  const PowerOutage({Key? key}) : super(key: key);

  @override
  _PowerOutageState createState() => _PowerOutageState();
}

class _PowerOutageState extends State<PowerOutage> {

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
                      child: Image(image: AssetImage('assets/images/power_outage_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Power Outage', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: SingleChildScrollView(
                      child: Text(AppStrings.powerOutageHeadline, style: AppStrings.headlineStyle(),),
                    ),
                  ),

                  Expanded(
                    flex: 3,
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
    'A power outage may', <Entry>[
    Entry('Disrupt communications, water and transportation.',),
    Entry('Close retail businesses, grocery stores, gas stations, ATMs, banks and other services.',),
    Entry('Cause food spoilage and water contamination.',),
    Entry('Prevent use of medical devices.'),
  ],
  ),

  Entry('Power Outage Tips', <Entry>[
    Entry('Keep freezers and refrigerators closed.'),
    Entry('Use a generator, but ONLY outdoors and away from windows.'),
    Entry('Disconnect appliances and electronics to avoid damage from electrical surges'),
    Entry('Have alternate plans for refrigerating medicines or using power-dependent medical devices.'),
    Entry('Check with local officials about heating and cooling locations open near you.'),
  ]),

  Entry(
    'How to Protect Yourself During A Power Outage', <Entry>[
      Entry('Go to a community location with power if heat or cold is extreme.',),
      Entry('Preparing for a Power Outage', <Entry>[
        Entry('Take an inventory of the items you need that rely on electricity. Plan for batteries and other alternative power sources to meet your needs when the power goes out, such as a portable charger or power bank. Have flashlights for every household member. Determine whether your home phone will work in a power outage and how long battery backup will last.'),
      ]),

      Entry('Know Your Medical Needs', <Entry>[
        Entry('Talk to your medical provider about a power outage plan for medical devices powered by electricity and refrigerated medicines. Find out how long medication can be stored at higher temperatures and get specific guidance for any medications that are critical for life.'),
      ]),

      Entry('Food Storage', <Entry>[
        Entry('Have enough nonperishable food and water. Keep freezers and refrigerators closed. The refrigerator will keep food cold for about four hours. A full freezer will keep the temperature for about 48 hours. Use coolers with ice if necessary. Monitor temperatures with a thermometer. Throw out food if the temperature is 4.4°C or higher.'),
      ]),

    Entry('Using Appliances During Power Outages', <Entry>[
      Entry('Install carbon monoxide detectors with battery backup in central locations on every level of your home. Avoid carbon monoxide poisoning. Generators, camp stoves or charcoal grills should always be used outdoors and at least 20 feet away from windows. Turn off or disconnect appliances, equipment, or electronics. Power may return with momentary surges or spikes that can cause damage.'),
    ]),
    ],
  ),

  //  sReturning After A Power Outage
  Entry('Returning After A Power Outage', <Entry>[
    Entry('When in doubt, throw it out! Throw away any food that has been exposed to temperatures  4.444°C or higher for two hours or more, or that has an unusual odor, color or texture.'),
    Entry('If the power is out for more than a day, discard any medication that should be refrigerated, unless the drug’s label says otherwise. Consult your doctor or pharmacist immediately for a new supply.'),
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

