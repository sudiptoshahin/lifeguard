
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import 'package:lifeguard/util/size_config.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class WildFire extends StatefulWidget {
  WildFire({Key? key}) : super(key: key);


  @override
  _WildFireState createState() => _WildFireState();
}

class _WildFireState extends State<WildFire> {

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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Image(image: AssetImage('assets/images/wildfire_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Wildfires', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: SizeConfig.safeBlockVertical * 20,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: Text(AppStrings.wildfireHeadline, style: AppStrings.headlineStyle(),),
                  ),

                  Expanded(child: ListView.builder(
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
    'Prepare for Wildfires',
    <Entry>[
      Entry(
        'Make an Emergency Plan', <Entry>[
          Entry('Make sure everyone in your household knows and understands what to do if you need to quickly evacuate.'),
        ],
      ),

      Entry('Strengthen your Home', <Entry>[
        Entry('Use fire-resistant materials to build, renovate or make repairs.'),
        Entry('Find an outdoor water source with a hose that can reach any area of your property.'),
        Entry('Create a fire-resistant zone that is free of leaves, debris or flammable materials for at least 30 feet from your home'),
        Entry('Designate a room that can be closed off from outside air. Close all doors and windows. Set up a portable air cleaner to keep indoor pollution levels low when smoky conditions exist.'),
      ]),

      Entry('Know your Evacuation Zone', <Entry>[
        Entry('You may have to evacuate quickly due to a wildfire. Practice with household, pets, and identify where you will go. '),
        Entry('Follow the instructions from local authorities. They will provide the latest recommendations based on the threat to your community and appropriate safety measures.'),
      ]),

      Entry('Gather Supplies', <Entry>[
        Entry('Have enough supplies for your household, include medication, disinfectant supplies, masks, pet supplies in your go bag or car trunk. Being prepared allows you to address smaller medical issues at home, alleviating'
            ' the burden on urgent care centers and hospitals.', <Entry>[
              Entry('Being prepared allows you to avoid unnecessary excursions and to address minor medical issues at home, alleviating the burden on urgent care centers and hospitals.'),
        ]),
        Entry('Be cautious when carrying flammable or combustible household products that can cause fires or explosions if handled wrong, such as aerosols, cooking oils, rubbing alcohol, and hand sanitizer.'),

        Entry('Keep your cell phone charged when wildfires could be in your area. Purchase backup charging devices to power electronics.'),

      ]),

    ],
  ),

  //  stay safe during
  Entry('Stay Safe During', <Entry>[
    Entry('Evacuate immediately if authorities tell you to do so!', <Entry>[
      Entry('Consider making plans with friends or family to shelter with them where you may be safer and more comfortable.'),
    ]),

    Entry('If trapped, then call 119 and give your location, but be aware that emergency response could be delayed or impossible. Turn on lights to help rescuers find you.'),
    Entry('Pay attention to emergency alerts and notifications for information and instructions.'),
    Entry('Use an N95 mask to protect yourself from smoke inhalation.', <Entry>[
      Entry('To ensure that healthcare workers have access to N95 respirators, it is best to limit your exposure to smoke rather than buy respirators. If you do not already have N95 respirators,'
          ' you can reduce your exposure to smoke by doing the following:',<Entry>[
            Entry('Choose a room to close off from outside air and set up a portable air cleaner or filter to keep the air in this room clean even when it’s smoky in the rest of the building and outdoors.'),
            Entry('Use high efficiency filters in your central air conditioning system to capture fine particles from smoke. If your system has fresh air intake, set the system to “recirculate” mode and close the outdoor intake damper.'),
            Entry('Avoid using anything that burns, such as candles and fireplaces. Do not vacuum, as vacuuming stirs up particles already inside your home. Do not smoke tobacco or other products. Smoking puts even more pollution into the air.'),
            Entry('If you are not ordered to evacuate but smoky conditions exist, stay inside in a safe location or go to a community building where smoke levels are lower.'),
            Entry('contact your healthcare provider for further care instructions and shelter in place, if possible.'),
      ]),
    ]),
  ]),

  //  returning home
  Entry('Returning Home After a Wildfire', <Entry>[
    Entry('Do not return home until authorities say it is safe to do so.'),
    Entry('Avoid hot ash, charred trees, smoldering debris, and live embers. The ground may contain heat pockets that can burn you or spark another fire.'),
    Entry('When cleaning, wear protective clothing, including a long-sleeved shirt, long pants, work gloves, appropriate cloth face coverings or masks, and sturdy thick-soled shoes during clean-up efforts.'),
    Entry('Use appropriate masks or respirators.'),
    Entry('When cleaning up ash, use a respirator to limit your exposure and '
        'wet debris to minimize breathing dust particles ', <Entry>[
          Entry('People with asthma and/or other lung conditions should take precautions in areas with poor air quality, as it can worsen symptoms. Children should not help with clean-up efforts.'),
          Entry('Pay attention to any health symptoms if you or your children have asthma, COPD, heart disease, or are pregnant. Get to medical help if you need it.'),
    ]),
    Entry('Send text messages or use social media to reach out to family and friends. Phone systems are often busy following a disaster. Make calls only in emergencies.'),
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

