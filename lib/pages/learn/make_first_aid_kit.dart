
import 'package:flutter/material.dart';
import 'package:lifeguard/pages/learn/learn.dart';
import 'package:lifeguard/util/utils.dart';

import '../../app_strings.dart';

class MakeFirstAidKit extends StatefulWidget {
  const MakeFirstAidKit({Key? key}) : super(key: key);

  @override
  _MakeFirstAidKitState createState() => _MakeFirstAidKitState();
}

class _MakeFirstAidKitState extends State<MakeFirstAidKit> {

  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => new Learn()));
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color(0xFF270000),
          title: Text("Learn", style: AppStrings.title1Style()),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Learn()));

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
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image(image: AssetImage('assets/images/make_first_aid.jpeg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 5.0),

                    child: Text('Make First Aid Kit', style: AppStrings.heading2Style(),),
                  ),


                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 300,
                      padding: EdgeInsets.only(bottom: 10.0),
                      margin: EdgeInsets.only(bottom: 50.0),
                      child: ListView.builder(
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

  Entry('A well-stocked first aid kit is a handy thing to have. To be prepared for emergencies:', <Entry>[
    Entry('Keep a first aid kit in your home and in your car.'),
    Entry('Carry a first aid kit with you or know where you can find one.'),
    Entry('Find out the location of first aid kits where you work.'),
  ]),

  Entry('Whether you buy a first aid kit or put one together, make sure it has all the items you may need:', <Entry>[
    Entry('Include any personal items such as medications and emergency phone numbers or other items your health-care provider may suggest.'),
    Entry('Check the kit regularly.'),
    Entry('Check expiration dates and replace any used or out-of-date contents.'),
  ]),

  Entry('The Red Cross recommends that all first aid kits for a family of four include the following:', <Entry>[
    Entry('2 absorbent compress dressings (5 x 9 inches)'),
    Entry('25 adhesive bandages'),
    Entry('1 adhesive cloth tape (10 yards x 1 inch)'),
    Entry('5 antibiotic ointment packets (approximately 1 gram)'),
    Entry('5 antiseptic wipe packets'),
    Entry('2 packets of aspirin (81 mg each)'),
    Entry('1 emergency blanket'),
    Entry('1 breathing barrier (with one-way valve)'),
    Entry('1 instant cold compress'),
    Entry('2 pair of nonlatex gloves (size: large)'),
    Entry('2 hydrocortisone ointment packets (approximately 1 gram each)'),
    Entry('1 3 in. gauze roll (roller) bandage'),
    Entry('1 roller bandage (4 inches wide)'),
    Entry('5 3 in. x 3 in. sterile gauze pads'),
    Entry('5 sterile gauze pads (4 x 4 inches)'),
    Entry('Oral thermometer (non-mercury/nonglass)'),
    Entry('2 triangular bandages'),
    Entry('Tweezers'),
    Entry('Emergency First Aid guide'),
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
