
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class ChemicalEmergency extends StatefulWidget {
  const ChemicalEmergency({Key? key}) : super(key: key);

  @override
  _ChemicalEmergencyState createState() => _ChemicalEmergencyState();
}

class _ChemicalEmergencyState extends State<ChemicalEmergency> {
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
                      child: Image(image: AssetImage('assets/images/chemical_emergencies_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Chemical Emergencies', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: SingleChildScrollView(
                      child: Text(AppStrings.chemicalEmergencyHeadline, style: AppStrings.headlineStyle(),),
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

  Entry(
    'Before a Chemical Emergency',
    <Entry>[
      Entry('A chemical attack could come without warning. Signs of a chemical release include difficulty breathing, eye irritation, loss of coordination, nausea or burning in the nose, throat and lungs. The presence of many dead insects or birds may indicate a chemical agent release.'),
      Entry('What to do to prepare for a chemical attack?', <Entry>[
        Entry('Build an Emergency Supply Kit and include', <Entry>[
          Entry('Duct tape'),
          Entry('Scissors'),
          Entry('Plastic (to cover doors, windows and vents)'),
        ]),
        Entry('Make a Family Emergency Plan.', <Entry>[
          Entry('Put a plan together by discussing the questions below with your family, friends or household to start your emergency plan.'),
          Entry('Consider specific needs in your household.'),
          Entry('Fill out a Family Emergency Plan'),
          Entry('Practice your plan with your family/household')
        ]),
      ]),
    ],
  ),

  //  stay safe during a tornado
  Entry('During a Chemical Emergency', <Entry>[
    Entry('What you should do in a chemical attack?', <Entry>[
      Entry('Quickly try to figure out which areas are affected or where the chemical is coming from, if possible.'),
      Entry('Get away immediately.'),
      Entry('If the chemical is inside your building, get out of the building without passing through the contaminated area, if possible.'),
      Entry('If you can\'t get out of the building or find clean air without passing through the affected area, move as far away as possible and shelter-in-place.'),
    ]),

    Entry('If you are instructed to remain in your home or office building, you should', <Entry>[
      Entry('Close doors and windows and turn off all ventilation, including furnaces, air conditioners, vents and fans.'),
      Entry('Seek shelter in an internal room with your disaster supplies kit.'),
      Entry('Seal the room with duct tape and plastic sheeting.'),
      Entry('Listen to the radio or television for instructions from authorities.')
    ]),

    Entry('If you are caught in or near a contaminated area outdoors', <Entry>[
      Entry('Quickly decide what is the fastest way to find clean air', <Entry>[
        Entry('Move away immediately, in a direction upwind of the source.'),
        Entry('Find the closest building to shelter in place.'),
      ]),
    ]),

  ]),

  //  returning home
  Entry('After a Chemical Emergency', <Entry>[
    Entry('Do not leave the safety of a shelter to go outdoors to help others until authorities say it is safe to do so.'),
    Entry('If you are affected by a chemical agent you will need immediate medical attention from a professional. If medical help is not immediately available, decontaminate yourself and help others decontaminate.'),
    Entry('How to decontaminate:', <Entry>[
      Entry('Use extreme caution when helping others who have been exposed to chemical agents.'),
      Entry('Remove all clothing and other items in contact with your body.', <Entry>[
        Entry('Cut off clothing normally removed over the head to avoid contact with the eyes, nose and mouth.'),
        Entry('Put contaminated clothing and items into a plastic bag and seal it.'),
        Entry('Remove eyeglasses or contact lenses. Put glasses in a pan of household bleach to decontaminate them and then rinse and dry.'),
      ]),

      Entry('Wash hands with soap and water.'),
      Entry('Flush eyes with water.'),
      Entry('Gently wash face and hair with soap and water before thoroughly rinsing with water.'),
      Entry('Proceed to a medical facility for screening and professional treatment.'),
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




