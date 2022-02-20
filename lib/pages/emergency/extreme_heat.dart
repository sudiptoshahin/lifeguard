
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class ExtremeHeat extends StatefulWidget {
  const ExtremeHeat({Key? key}) : super(key: key);

  @override
  _ExtremeHeatState createState() => _ExtremeHeatState();
}

class _ExtremeHeatState extends State<ExtremeHeat> {
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
                      child: Image(image: AssetImage('assets/images/extreme_heat_banner.jpg'), fit: BoxFit.cover,)
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                    child: Text('Extreme Heat', style: AppStrings.heading2Style(),),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                    child: SingleChildScrollView(
                      child: Text(AppStrings.extremeHeatHeadline, style: AppStrings.headlineStyle(),),
                    ),
                  ),

                  Expanded(
                    flex: 4,
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

  Entry('Remember:', <Entry>[
    Entry('Extreme heat can occur quickly and without warning.'),
    Entry('Older adults, children and sick or overweight individuals are at greater risk from extreme heat.'),
    Entry('Humidity increases the feeling of heat as measured by a heat index.'),
  ]),

  Entry('IF YOU ARE UNDER AN EXTREME HEAT WARNING:', <Entry>[
    Entry('Find air conditioning.'),
    Entry('Avoid strenuous activities.'),
    Entry('Wear light clothing.'),
    Entry('Check on family members and neighbors.'),
    Entry('Drink plenty of fluids.'),
    Entry('Watch for heat cramps, heat exhaustion and heat stroke.'),
    Entry('Never leave people or pets in a closed car.'),
  ]),

  Entry('Prepare NOW', <Entry>[
    Entry('Find places in your community where you can go to get cool'),
    Entry('Try to keep your home cool:', <Entry>[
      Entry('Do not rely on a fan as your primary cooling device.'),
      Entry('Cover windows with drapes or shades.'),
      Entry('Weather-strip doors and windows.'),
      Entry('Use window reflectors such as aluminum foil-covered cardboard to reflect heat back outside.'),
      Entry('Add insulation to keep the heat out.'),
      Entry('Use a powered attic ventilator, or attic fan, to regulate the heat level of a building’s attic by clearing hot air.'),
      Entry('Install window air conditioners and insulate around them.'),
    ]),
  ]),

  Entry('Be Safe DURING', <Entry>[
    Entry('Never leave a child, adult, or animal alone inside a vehicle on a warm day.'),
    Entry('Find places with air conditioning. Libraries, shopping malls, '
        'and community centers can be a cool place to beat the heat. '
        'Stay informed and check with local authorities about possible closures prior '
        'to going to cooling centers.', <Entry>[
          Entry('Take cool showers or baths.'),
          Entry('Don’t rely solely on fans to keep you cool. While electric fans might provide some comfort, when temperatures are really hot, they won’t prevent heat-related illness.'),
          Entry('Use your stove and oven less to maintain a cooler temperature in your home.'),
          Entry('If you’re outside, find shade. Wear a hat wide enough to protect your face. Wear appropriate cloth masks and keep a physical distance of at least six feet while you’re outside. Don\'t wear a masks if you have trouble breathing or if you are unable to remove it on your own. Children under the age of 2 shouldn’t wear face coverings. If you can, wash your reusable mask regularly.'),
          Entry('During extreme heat events, use a cloth mask that has breathable fabric, such as cotton, instead of polyester. Keep in mind that masks with filters, which are used when cleaning mold or debris, are often made with synthetic materials, which makes it harder to breathe.'),
          Entry('Ensure that your mask covers your mouth and nose and is somewhat snug on your face, even when it is hot. Make sure that it is not too tight. You should not have trouble breathing while wearing the mask. If it is too tight, loosen it so that if fits snuggly without slipping. If it is too tight, loosen it so that if fits snugly without slipping.'),
          Entry('Be sure to have several clean masks to use in case your mask becomes wet or damp from sweat during an extreme heat event. Cloth masks should not be worn when they become damp or wet. Be sure to wash your cloth masks regularly.'),
          Entry('Wear loose, lightweight, light-colored clothing.'),
          Entry('Drink plenty of fluids to stay hydrated. If you or someone you care for is on a special diet, ask a doctor what would be best.'),
    ]),
    Entry('HEAT CRAMPS', <Entry>[
      Entry('Signs:', <Entry>[Entry('Muscle pains or spasms in the stomach, arms or legs'),]),
      Entry('Actions:', <Entry>[Entry('Go to a cooler location. Remove excess clothing. Take sips of cool sports drinks with salt and sugar. If you are sick and need medical attention, call your healthcare provider first. Follow your healthcare provider’s instructions about whether you should go to the hospital or cooler location yourself,. If cramps last more than an hour, seek medical attention. If possible, put on a mask before medical help arrives.')]),
    ]),
    Entry('HEAT EXHAUSTION', <Entry>[
      Entry('Signs:', <Entry>[Entry('Heavy sweating, paleness, muscle cramps, tiredness, weakness, dizziness, headache, fainting, nausea, vomiting'),]),
      Entry('Actions:', <Entry>[Entry('Go to an air-conditioned place and lie down. Loosen or remove clothing. Take a cool bath. Take sips of cool sports drinks with salt and sugar. Call your healthcare provider if symptoms get worse or last more than an hour.')]),
    ]),
    Entry('HEAT STROKE', <Entry>[
      Entry('Signs:', <Entry>[
        Entry('Extremely high body temperature (above 71 Celsius) taken orally'),
        Entry('Extremely high body temperature (above 71 Celsius) taken orally'),
        Entry('Rapid, strong pulse'),
        Entry('Dizziness, confusion or unconsciousness'),
      ]),
      Entry('Actions:', <Entry>[Entry('Call 119 or 1990 or get the person to a hospital immediately. Cool down with whatever methods are available until medical help arrives.')]),
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