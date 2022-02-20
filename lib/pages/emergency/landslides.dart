
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import '../../util/utils.dart';
import 'emergency.dart';

class LandSlide extends StatefulWidget {
  const LandSlide({Key? key}) : super(key: key);

  @override
  _LandSlideState createState() => _LandSlideState();
}

class _LandSlideState extends State<LandSlide> {

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
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints){
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
                        child: Image(image: AssetImage('assets/images/landslide_banner.jpg'), fit: BoxFit.cover,)
                    ),

                    Container(
                      // color: Colors.redAccent,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10.0),
                      child: Text('Landslides & Debris Flow', style: AppStrings.heading2Style(),),
                    ),

                    Container(
                      height: 100,
                      padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        child: Text(AppStrings.landslidesHeadline, style: AppStrings.headlineStyle(),),
                      ),
                    ),

                    Container(
                      child: Expanded(
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
        ),

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
    'Before a Landslide',
    <Entry>[
      Entry('The following are things you can do to protect yourself, your family and your property from the effects of a landslide or debris flow:'),
      Entry('To begin preparing, you should build an emergency kit and make a family communications plan.'),
      Entry('Make a plan for your household, including your pets, so that you and your family know what to do, where to go, and what you will need to protect yourselves from landslides'),
      Entry('Connect with your local emergency services, heed evacuation warnings.'),
      Entry('Leave if you have been told to evacuate or you feel it is unsafe to remain in your home.'),
      Entry('Prepare for landslides by following proper land-use procedures - avoid building near steep slopes, close to mountain edges, near drainage ways or along natural erosion valleys.'),
      Entry('Become familiar with the land around you. Learn whether landslides have occurred in your area by contacting local officials. However, don’t assume that what happened last time will happen next time. Debris flows can start in places they’ve never been and return to slopes where they’ve already been.'),
      Entry('Get an assessment of your property by a qualified geotechnical professional'),
      Entry('Consult a professional for advice on appropriate preventative measures for your home or business, such as flexible pipe fittings, which can better resist breakage.'),
      Entry('In mud and debris flow areas, consider building channels or deflection walls to try to direct the flow around buildings. Be aware, however, that when a flow is big enough, it goes where it pleases. Also, if you divert a flow and it flows on a neighbor\'s property, you may be liable for damages.'),
      Entry('Gather supplies in case you have to leave immediately or '
      'if services are cut off. Keep in mind each person’s specific needs, '
          'including medication. Do not forget the needs of pets.', <Entry>[
            Entry('Include non-perishable foods, cleaning supplies, and water for several days, in case you have to leave immediately or if services are cut off in your area. If you are able to, set aside items like soap, hand sanitizer that contains at least 60 percent alcohol, disinfecting wipes, and general household cleaning supplies that you can use to disinfect surfaces you touch regularly. After a landslide, you may not have access to these supplies for days or even weeks.'),
            Entry('Being prepared allows you to avoid unnecessary excursions and allows you to address minor medical issues at home, alleviating the burden on urgent care centers and hospitals.'),
          ]),
    ],
  ),

//  Recognize Warning Signs
 Entry('Recognize Warning Signs', <Entry>[
   Entry('Watch for debris flows and other fast-moving landslides that pose threats to life:', <Entry>[
     Entry('If you are near a wildfire burn area, sign up for emergency alerts and pay attention to weather forecasts for the burn area. The weather in the burn area could be very different from where you are.'),
     Entry('Listen and watch for rushing water, mud, unusual sounds.'),
     Entry('Unusual sounds, such as trees cracking or boulders knocking together, might indicate moving debris'),
     Entry('A faint rumbling sound that increases in volume is noticeable as the landslide nears.'),
     Entry('Fences, retaining walls, utility poles, boulders, or trees move.'),
     Entry('Huge boulders in the landscape can be signs of past debris flows.'),

   ]),
   Entry('Watch for slow-moving landslides that pose threats to property:', <Entry>[
     Entry('Changes occur in your landscape such as patterns of storm-water drainage on slopes (especially the places where runoff water converges) land movement, small slides, flows, or progressively leaning trees.'),
     Entry('Doors or windows stick or jam for the first time'),
     Entry('New cracks appear in plaster, tile, brick, or foundations'),
     Entry('Outside walls, walks, or stairs begin pulling away from the building.'),
     Entry('Slowly developing, widening cracks appear on the ground or on paved areas such as streets or driveways.'),
     Entry('Underground utility lines break.'),
     Entry('Bulging ground appears at the base of a slope.'),
     Entry('Water breaks through the ground surface in new locations.'),
     Entry('Fences, retaining walls, utility poles, or trees tilt or move'),
     Entry('The ground slopes downward in one direction and may begin shifting in that direction under your feet.'),
   ]),
 ]),

  Entry('During a Landslide', <Entry>[
    Entry('Listen to local news stations on a battery-powered radio for warnings.'),
    Entry('Heed all warnings and evacuation notices', <Entry>[
      Entry('Always follow the instructions from local emergency managers. They provide the latest recommendations based on the threat in your community.'),
      Entry('Make plans to shelter with friends or family in advance so that you can evacuate to their safe location. If you are unable to do so, check with local authorities to determine which public shelters are available.'),
    ]),

    Entry('During a storm that could cause a landslide, stay alert and awake. Many deaths from landslides occur while people are sleeping.'),
    Entry('Be aware that by the time you are sure a debris flow is coming, that will be too late to get away safely. Never cross a road with water or mud flowing. Never cross a bridge if you see a flow approaching. It can grow faster and larger too quickly for you to escape.'),
    Entry('If you do get stuck in the path of a landslide move uphill as quickly as possible. '),
    Entry('Avoid river valleys and low-lying areas during times of danger.'),
    Entry('If you are near a stream or channel, be alert for any sudden increase or decrease in water flow or water that changes from clear to muddy. These can be signs that a landslide is coming.'),
  ]),

  Entry('After a Landslide', <Entry>[
    Entry('Stay away from the slide area. There may be danger of additional slides.'),
    Entry('Listen to local radio or television stations for the latest emergency information.'),
    Entry('Watch for flooding. Floods sometimes follow landslides and debris flows because they may both be started by the same conditions.'),
    Entry('Check for injured and trapped persons near the slide, without entering the direct slide area. Direct rescuers to their locations.'),
    Entry('Report broken utility lines and damaged roadways and railways to appropriate authorities. Reporting potential hazards will get the utilities turned off as quickly as possible, preventing further hazard and injury.'),
    Entry('Allow trained professionals to check the building foundation, chimney, and surrounding land for damage.'),
    Entry('Replant damaged ground as soon as possible since erosion caused by loss of ground cover can lead to flash flooding and additional landslides in the near future.'),
    Entry('Seek advice from a geotechnical expert for evaluating landslide hazards or designing corrective techniques to reduce landslide risk. A professional will be able to advise you of the best ways to prevent or reduce landslide risk, without creating further hazard.'),

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
