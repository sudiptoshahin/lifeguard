
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class AttackInCrowded extends StatefulWidget {
  const AttackInCrowded({Key? key}) : super(key: key);

  @override
  _AttackInCrowdedState createState() => _AttackInCrowdedState();
}

class _AttackInCrowdedState extends State<AttackInCrowded> {
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
            Navigator.pop(context);
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
                      child: Image(image: AssetImage('assets/images/attack_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Attacks in Crowded and Public Spaces', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: SingleChildScrollView(
                      child: Text(AppStrings.attacksHeadline, style: AppStrings.headlineStyle(),),
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



                  SizedBox(height: 100),

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

  Entry('What are Mass Attacks?', <Entry>[
    Entry('Types of Mass Attacks', <Entry>[
      Entry('Active shooter: Individuals using firearms to cause mass casualties.'),
      Entry('Individuals using a vehicle to cause mass casualties.'),
      Entry('Individuals using homemade bombs to cause mass casualties.'),
      Entry('Other methods of mass attacks may include knives, fires, drones or other weapons.'),
    ]),
  ]),

  Entry('Be Informed', <Entry>[
    Entry('Stay Alert', <Entry>[
      Entry('Always be aware of your environment and any possible dangers.'),
    ]),
    Entry('If you see something, say something to local authorities. That includes suspicious packages, people behaving strangely, or someone using strange communications.'),
    Entry('Observe warning signs.', <Entry>[
      Entry('Signs might include unusual or violent communications, expressed anger or intent to cause harm and substance abuse. These warning signs may increase over time.'),
    ]),
    Entry('Have an exit plan.', <Entry>[
      Entry('Identify exits and areas to hide wherever you go, including work, school and special events.'),
    ]),

    Entry('Learn lifesaving skills.', <Entry>[
      Entry('Take trainings such as You Are the Help Until Help Arrives and first aid to assist the wounded before help arrives.'),
    ]),
  ]),

  Entry('Survive DURING', <Entry>[
    Entry('Run to Safety', <Entry>[
      Entry('Seek safety. Getting away from the attacker is the top priority.'),
      Entry('Leave your belongings behind and get away. If you are not wearing a mask, do not stop to put one on. It is more important to run to safety.'),
      Entry('Call 119 when you are safe and describe the attacker, location and weapons.'),
    ]),
    Entry('Cover and Hide', <Entry>[
      Entry('If you can’t evacuate, cover and hide. Find a place to hide out of view of the attacker and if possible, put a solid barrier between yourself and the threat. If you are hiding with people who are not part of your household, wear a mask and maintain a distance of six feet between yourself and others, if possible. Children under 2 years old, people who have trouble breathing, and people who cannot remove masks on their own should not wear them. Do not leave your hiding place to retrieve your mask.'),
      Entry('Lock and block doors, close blinds and turn off lights.'),
      Entry('Keep silent.'),
    ]),
    Entry('Defend, Disrupt, Fight', <Entry>[
      Entry('Fight only as a last resort. When you can’t run or cover, attempt to disrupt the attack or disable the attacker.'),
      Entry('Be aggressive and commit to your actions.'),
      Entry('Recruit others to ambush the attacker with makeshift weapons like chairs, fire extinguishers, scissors, books, etc.'),
      Entry('Be prepared to cause severe or lethal injury to the attacker.'),
    ]),
    Entry('Help the Wounded', <Entry>[
      Entry('Take care of yourself first and then, if you are able, help the wounded get to safety and provide immediate care. If you are experiencing a medical emergency, call 119'),
    ]),
  ]),

  Entry('Be Safe AFTER', <Entry>[
    Entry('When Law Enforcement Arrives', <Entry>[
      Entry('Remain calm and follow instructions.'),
      Entry('Keep hands visible and empty.'),
      Entry('Report to designated areas to provide information and get help.'),
      Entry('Follow law enforcement’s instructions and evacuate in the direction they tell you to. '),
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
