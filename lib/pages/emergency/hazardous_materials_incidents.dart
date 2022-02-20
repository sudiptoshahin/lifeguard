
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class HazardousMaterialIncident extends StatefulWidget {
  const HazardousMaterialIncident({Key? key}) : super(key: key);

  @override
  _HazardousMaterialIncidentState createState() => _HazardousMaterialIncidentState();
}

class _HazardousMaterialIncidentState extends State<HazardousMaterialIncident> {

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
                      child: Image(image: AssetImage('assets/images/hazardous_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Hazardous Materials Incidents', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: SingleChildScrollView(
                      child: Text(AppStrings.hazardousMaterialsHeadline, style: AppStrings.headlineStyle(),),
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

  Entry(
    'Before a Hazardous Materials Incident',
    <Entry>[
      Entry(
        'Protect yourself from a hazardous materials incident',),

        Entry('Build an Emergency Supply Kit with the addition of plastic sheeting and duct tape.', <Entry>[
          Entry('Water'),
          Entry('Food'),
          Entry('Battery-powered or hand crank radio and a NOAA Weather Radio with tone alert'),
          Entry('Flashlight'),
          Entry('First aid kit'),
          Entry('Whistle (to signal for help)'),
          Entry('Dust mask (to help filter contaminated air)'),
          Entry('Plastic sheeting and duct tape (to shelter in place)'),
          Entry('Moist towelettes, garbage bags and plastic ties (for personal sanitation)'),
          Entry('Wrench or pliers (to turn off utilities)'),
          Entry('Manual can opener (for food)'),
          Entry('Local maps'),
          Entry('Cell phone with chargers and a backup battery'),
      ]),

      Entry('Make a Family Emergency Plan.',<Entry>[
        Entry('Put a plan together by discussing the questions below with your family, friends or household to start your emergency plan.'),
        Entry('Consider specific needs in your household.', <Entry>[
          Entry('Different ages of members within your household'),
          Entry('Responsibilities for assisting others'),
          Entry('Locations frequented'),
          Entry('Dietary needs'),
          Entry('Medical needs including prescriptions and equipment'),
          Entry('Disabilities or access and functional needs including devices and equipment'),
          Entry('Languages spoken'),
          Entry('Cultural and religious considerations'),
          Entry('Pets or service animals'),
          Entry('Households with school-aged children'),

        ]),
        Entry('Fill out a Family Emergency Plan'),
        Entry(' Practice your plan with your family/household'),
      ]),
      Entry('Know how to operate your home’s ventilation system.'),
      Entry('Identify an above-ground shelter room with as few openings as possible'),
      Entry('Read more about sheltering in place.', <Entry>[
        Entry('Stay at Home'),
        Entry('Mass Care Shelter'),
        Entry('Sheltering in Place', <Entry>[
          Entry('Local authorities may not immediately be able to provide information on what is happening and what you should do'),
          Entry('Watch TV and listen to the radio or check the Internet often for official news and instructions as they become available.'),
          Entry('Lock doors, close windows, air vents and fireplace dampers.'),
          Entry('Go into an interior room with few windows if possible'),
          Entry('Seal all windows, doors and air vents with thick plastic sheeting and duct tape. Consider measuring and cutting the sheeting in advance to save time.'),
          Entry('Cut the plastic sheeting several inches wider than the openings and label each sheet.'),
          Entry('Duct tape plastic at corners first and then tape down all edges.'),
          Entry('Be prepared to improvise and use what you have on hand to seal gaps so that you create a barrier between yourself and any contamination.'),
      ]),

    ],
  ),]),

  //  stay safe during a tornado
  Entry('During a Hazardous Materials Incident', <Entry>[
    Entry('Listen to local radio or television stations for detailed information'
      'and follow instructions carefully. '
      'Remember that some toxic chemicals are odorless.', <Entry>[
        Entry('Do so immediately.'),
        Entry('Stay tuned to the radio or television for information on evacuation routes, temporary shelters and procedures.'),
        Entry('If you have time, minimize contamination in the house by closing all windows, shutting all vents and turning off attic fans.'),
        Entry('Take pre-assembled disaster supplies.'),
        Entry('Remember to help your neighbors who may require special assistance — infants, elderly people and people with access and functional needs.'),
        Entry('Stay upstream, uphill and upwind. In general, try to go at least a half mile from the danger area'),
        Entry('Do not walk into or touch any spilled liquids, airborne mists or condensed solid chemical deposits. Try not to inhale gases, fumes and smoke. If possible, cover mouth with a cloth or mask while leaving the area.'),
        Entry('Stay away from accident victims until the hazardous material has been identified.'),
        Entry('Stop and seek shelter in a permanent building.'),
        Entry('If you must remain in your car, keep car windows and vents closed and shut off the air conditioner and heater'),
        Entry('Close and lock all exterior doors and windows. Close vents, fireplace dampers and as many interior doors as possible.'),
        Entry('Turn off air conditioners and ventilation systems, or set ventilation systems to 100 percent recirculation so that no outside air is drawn into the building.'),
        Entry('If gas or vapors could have entered the building, take shallow breaths through a cloth or a towel.'),
        Entry('Avoid eating or drinking any food or water that may be contaminated.'),
        Entry('Go into your pre-selected shelter room.'),
        Entry('Seal gaps under and around the following areas with wet towels'
              'plastic sheeting, duct tape, wax paper or aluminum foil', <Entry>[
            Entry('Doorways and windows'),
            Entry('Air conditioning units'),
            Entry('Bathroom and kitchen exhaust fans'),
            Entry('Stove and dryer vents with duct tape and plastic sheeting'),
        ]),
      ]),
  ]),

  //  returning home
  Entry('After a Hazardous Materials Incident', <Entry>[
    Entry('Listen to local radio or television stations for the latest emergency information.'),
    Entry('Go to a designated public shelter if you have been told to evacuate or you feel it is unsafe to remain in your home'),
    Entry('Act quickly if you have come in to contact with or have been exposed to hazardous chemicals.'),
    Entry('Follow decontamination instructions from local authorities.'),
    Entry('Seek medical treatment for unusual symptoms as soon as possible.'),
    Entry('Place exposed clothing and shoes in tightly sealed containers.'),
    Entry('Advise everyone who comes in to contact with you that you may have been exposed to a toxic substance.'),
    Entry('Return home only when authorities say it is safe. Open windows and vents and turn on fans to provide ventilation.'),
    Entry('Find out from local authorities how to clean up your land and property.'),
    Entry('Report any lingering vapors or other hazards to your local emergency services office.'),
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

