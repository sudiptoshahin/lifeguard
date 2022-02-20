
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeguard/util/size_config.dart';

class AppStrings {

  AppStrings._();

  static const String firstAidTitle = """First Aid""";

  /*** psychological first aid ***/
  static const String pfa_title = """Psychological First Aid""";
  static const String pfa_headline = '''Psychological first aid (PFA) is a set of actions that can offer immediate support and comfort to people affected by a critical event. People may be visibly distressed, affected by intense emotions, be apathetic or have lost hope. PFA is about providing basic, human support, delivering practical information and showing empathy, concern, respect and confidence in the abilities of the individual.''';
  static const String pfa_basic_element1_title = """Stay close""";
  static const String pfa_basic_element1_subtitle = """You can help to rebuild an individual's trust and sense of security by staying physically close and by displaying care and empathy. Be prepared if the person appears anxious, displays extreme emotions, shouts or rejects help.""";
  static const String pfa_basic_element2_title = "Listen Actively";
  static const String pfa_basic_element2_subtitle = """Take the time to listen carefully in order to help someone going through a difficult time. Listen actively by asking clarifying questions, without probing.""";
  static const String pfa_basic_element3_title = """Accept Feelings""";
  static const String pfa_basic_element3_subtitle = """People in crisis may display very different emotions. Accept the person's interpretation of the events and acknowledge their feelings.""";
  static const String pfa_basic_element4_title = """Provide general care and practical help.""";
  static const String pfa_basic_element4_subtitle = """Practical assistance, such as offering a glass of water, can be a great help. Avoid taking over more responsibility for the situation than the person actually needs.""";

  /** sting or bites **/
  static const String stingbites_title = """String or Bites""";
  static const String stingbites_headline = """Bites and stings can cause serious injury or illness. Protect yourself and your family by following these precautions for general bites and stings or those from ticks, specifically.""";

  static const String stingbites_related_title = """Related First Aid""";

  static const String stingbites_related_item1_title = """Insect Sting & Bites""";
  static List<String> stingbites_related_item1_text = [' A person who has been bitten or stung will feel pain. Check for a bite mark or stinger and any swelling and/or bleeding. ',
    'Remove the stinger by scraping it awaywith a flat surface, such as a credit card',
    'Otherwise, carefully remove it with tweezers, being sure to grab the base of the stinger to avoid squeezing the venom sac.'
    'Wash wound with soap and water, cover with a dressing, then apply ice or a cold pack.'
    'Call 1990 or the local emergency number if the person seems to be having an allergic or anaphylaxis reaction. Signs include a rash, itchiness, swelling on their hands, feet or face or a slowing down of their breathing.'
  ];

  static const String stingbites_related_item2_title = """Ticks""";
  static const List<String> stingbites_related_item2_text = ['Grasp tick with fine-tipped, pointed, non-etched, non-rasped tweezers close to skin and pull slowly. Don\'t forget to wear disposable gloves, if available.',
      'DO NOT try to burn tick off or apply petroleum jelly or nail polish to tick.',
      ' Wash bite area with soap and water.',
      'Apply antiseptic or triple antibiotic ointment, if available. Check to see if the person has no known allergies or sensitivities to the ointment.',];


  static const String stingbites_related_item3_title = """Scorpion & Spiders""";
  static const List<String> stingbites_related_item3_text = ['Call 1990 if you suspect that a person has been bitten by a black widow or brown recluse spider, stung by a scorpion or has a severe allergic reaction. These spiders bites and some scorpions stings can be life-threatening to humans, especially young children and the elderly.',
  'Wash the wound thoroughly.',
  'Apply antibiotic ointment and bandage the wound.',
  'Apply an ice or cold pack to the area to reduce pain and swelling.',
  'Encourage the person to seek medical attention if 1990 is not called. If you transport the person to a medical facility, keep the bitten area still and elevated.',];

  static const String stingbites_related_item4_title = """Jellyfish""";
  static const List<String> stingbites_related_item4_text = ['A person with a jellyfish sting should get out of the water as soon as possible.',
  'Irrigate the stinging area with large amounts of vinegar for at least 30 seconds. If vinegar is not available, try using a baking soda slurry. Do not touch the affected area with bare hands.',
  'When the stinging stops, care for pain with hot water immersion. If possible, have the person take a hot shower for 20 minutes.',
  'Call 1990 if the person starts to have trouble breathing, has a history of severe reactions to marine-life stings or is stung on the face or neck.'];


  static const String stingbites_related_item5_title = """Venomous Snakes""";
  static const List<String> stingbites_related_item5_text = ['A person who has been bitten will feel pain. Look for fang marks and swelling.',
  'Call 1990 immediately if a person is bitten by a venomous snake.',
  'Gently wash the wound.',
  'Keep the bitten part still and lower than the heart. Keep the person calm and do not allow him or her to walk unless absolutely necessary.'];

  static const String stingbites_related_item6_title = """Animals""";
  static const List<String> stingbites_related_item6_text = ['Do not try to stop, catch or hold the animal that bit the person.',
  'If bleeding is serious: Control bleeding first; do not attempt to clean the wound. The wound will be cleaned at a medical facility.',
  'If bleeding is minor: Wash the wound with soap and water, and irrigate with clean tap water. Then control any bleeding and apply antibiotic ointment and a dressing.',];

  static const String allergyTitle = """Allergies or Anaphylaxis""";
  static const List<String> allergyText = ['The person may develop a rash, itchiness or swelling on their hands, feet or face. Their breathing may slow down. Vomiting and diarrhea can also occur. Common causes of allergic reactions are pollen, stings, latex and some food items such as nuts or dairy products.',
  'If the person is suffering from anaphylaxis, call 1990. If the person is anaphylaxis (breathing problems, shock or change in mental status) and has an auto-injector/Epi-pen, help them to use it.',
    'Give them constant reassurance while waiting for the ambulance.'];

  static const String astamaTitle = "Astama Attacks";
  static const List<String> astamaText = ['Help the person sit in a comfortable position and help them take their medication. When someone has an asthma attack, the muscles in the airways narrow, making it difficult for them to breathe. Using an inhaler relaxes the muscles, allowing the air passages to expand and ease the person\'s breathing.',
  'Reassure the person. If the attack becomes severe, they don\'t have their medication or they don\'t improve with medication, call 1990 or get someone else to do it. A mild attack should ease within a few minutes. If it doesn\'t, or the inhaler has no effect, call 1990.',];

  static const List<String> unconciousBreatingText = ['Check breathing by tilting their head backwards and looking and feeling for breaths. When a person is unconscious their muscles relax and their tongue can block their airway so they can no longer breathe. Tilting their head back opens the airway by pulling the tongue forward. Looking at their chest to see if it\'s moving, and feeling for breaths on your cheek, will help you tell if they\'re breathing or not.',
  'Move them onto their side and tilt their head back. Putting them in this position with their head back helps keep the airway open by making sure their tongue falls forward and blood and vomit drain out.',
  'Call 1990 as soon as possible, or get someone else to do it.'];

      static const List<String> unconciousNotBreatingText = ['Check breathing by tilting their head backwards and looking and feeling for breaths. When a person is unconscious their muscles relax and their tongue can block their airway so they can no longer breathe. Tilting their head back opens the airway by pulling the tongue forward. Looking at their chest to see if it\'s moving, and feeling for breaths on your cheek, will help you tell if they\'re breathing or not.',
  'Call 1990 as soon as possible, or get someone else to do it. If breaths are felt, go to Unconscious Breathing in the Related First Aid section.',
  'If no breaths are felt, start chest compressions. Place the heel of one hand on the center of the chest and the heel of the other hand on top of the first, lacing your fingers together.',
  'Push firmly downwards in the middle of the chest and then release. Push hard and fast. These are called chest compressions. This keeps blood pumping around their body and helps keep the vital organs, including the brain, alive, and may dislodge an airway obstruction.',
  'Push at a rate of 100 compressions per minute, until help arrives. Let the chest rise completely before pushing down again.'];

  static const List<String> burnText = ['Cool the burn under cool running water for at least ten minutes. Cooling the burn will reduce pain, swelling and the risk of scarring. The faster and longer a burn is cooled, the less the impact of the injury.',
  'If the burn requires further medical care, loosely cover the burn with plastic wrap or a clean plastic bag. Otherwise, it does not need plastic covering. This helps prevent infection by keeping the area clean. It\'s an ideal covering because it doesn\'t stick to the burn and reduces pain by keeping air from the skin\'s surface.',
  'If necessary, call 1990 or get someone else to do it. Always call 1990 if a child has been burned, the burn blisters or redness, affects more than one area of the body, covers hands, feet, joints or face, or if underlying tissues are visible or the face, neck, and chest If you have had burns on your genitals or dialysis, dial 1990.',];

  static const List<String> chokingText = ['Hit them firmly on their back between the shoulder blades 5 times to dislodge the object. Then give 5 quick abdominal thrusts. This creates a strong vibration and pressure in the airway, which is often enough to dislodge the blockage. Dislodging the object will allow them to breathe again.',
  'Always call 1990 or get someone else to do it when someone is choking.'];

  static const List<String> diabeticText = ['Give them something containing sugar, such as sugar tablets, orange juice, sugar-containing candy or a non-diet drink. In diabetic emergencies, blood sugar levels can become too low; this can cause people to collapse. Giving them something sugary, including candy such as Skittles, will help raise their blood sugar levels and improve their bodily function. Avoid giving them a diet drink, as it won\'t have any sugar in it and will not help them.',
  'Reassure the person. Call 1990 if in doubt or they don\'t improve, have trouble breathing or lose consciousness.'];

  static const List<String> distressText = ['Show you are listening and calmly ask them how you can help. You must try to establish trust by showing them respect.',
  'Be considerate of what is going on around them and what they need. Remember that they may have difficulty letting you know what they need. For example, they may not speak English very well or be able to hear you.'];

  static const List<String> headInjuryText = ['Ask them to rest and apply a cold compress to the injury (e.g. ice pack, frozen vegetables wrapped in a towel) Applying a cold compress to the injury will reduce external swelling and pain. In addition to external swelling, when a person sutters a blow to the head, the brain can be shaken inside the skull. This may result in a more serious head injury (e.g. concussion), which may make them feel sick, drowsy or confused.',
  'If they become confused, drowsy, vomit or if the fall was greater than 2 times their height, call 1990 or get someone else to do it. This could be a sign of a serious injury to the head.',];

  static const List<String> heartAttackText = ['The person may have persistent vice-like chest pain, or isolated unexplained discomfort in arms, neck, jaw, back, or stomach. This pain is caused by a blockage of the blood supply to the heart muscle, and the pain will not ease with rest.',
  'Call 1990 as soon as possible, or get someone else to do it. The person must receive medical assistance as soon as possible, because a heart attack is potentially very serious and needs immediate attention.',
  'Give them aspirin, as long as they\'re not allergic. The best is one not enteric(coated).',
  'Make sure they are in a position that is comfortable for them (e.g. sit them on the floor, leaning against a wall or chair) This will ease the strain on the heart. Sitting them on the floor also means they are less likely to hurt themselves if they collapse.',
  'Give them constant reassurance while waiting for the ambulance. If they\'re not allergic, give them aspirin.'];

  static const List<String> hypothermiaText = ['The environment is usually cold but a person can develop hypothermia in a warm environment, as well. The person may be shivering, pale and cold to touch. They may also be disoriented. Many instances of hypothermia occur inside when there is cold weather and a lack of heating.',
  'Call 1990 as soon as possible, or get someone else to do it.',
  'Warm the person slowly, giving constant reassurance. You can warm them by wrapping them in a blanket and giving warm drinks and high-energy foods.'];

  static const List<String> meningitisText = ['The person will complain of a stiff neck. They also may have flu-like symptoms, muscle and joint pain, a headache, a high temperature, and be sensitive to light. Other symptoms include cold hands and feet, joint pain, drowsiness and vomiting. A person with meningitis can have one or more symptoms, and some symptoms occur later on as the infection develops.',
  'When you observe these symptoms, call 1990. A person with meningitis can deteriorate very quickly. It is potentially very serious and needs immediate attention.',
  'Give them constant reassurance while waiting for the ambulance. If they have a fever, you can use cold drinks to cool the person.'];

  static const List<String> poisoningHarmfulSubstanceText = ['Establish what they have taken, when, and how much. The emergency services will want to know this information.',
  'Call poison control. Call 1990 if they become unconscious, have a change in behavior, have difficulty breathing, or if you think they are suicidal. The substance could be extremely harmful and the person may need urgent medical attention.',
  'Do not make the person sick or give them anything to drink unless instructed to do so by poison control. By making them sick, you can cause further damage to their throat or block their airway.'];

  static const List<String> seizureText = ['Do not restrain them but put a blanket or clothing next to their head, but not under it, to protect them from injury. Placing under their head may compromise the airway. Restraining them may cause injury to you or them. Let the seizure run its normal course.',
  'After the seizure, roll the person to their side with their head tilted back. This will make sure they keep breathing and will allow any fluids to drain from their mouth.'];

  static const List<String> shockText = ['Look for the following to determine if someone may be in shock: restlessness or irritability; nausea or vomiting ; drowsiness, confusion or loss of consciousness; pale, cool, moist skin. There may also be a blue tinge to their lips and fingernails. They also may have rapid breathing and pulse.',
  'Leave them lying flat. You may not be sure of the person\'s condition.',
  'Control any external bleeding.',
  'Keep the person from getting chilled or overheated.',
  'Do not give them anything to eat or drink. Just comfort them until the EMS personnel take over.',
  'Send someone to call 1990 or the local emergency number.'];

  static const List<String> strainsAndSpineText = ['Remember RICE: Rest, Immobilize, Cold, Elevate. This is for general care for injuries to muscles, bones and joints.',
  'Rest.\nDon\'t move or straighten the injured area.',
  'Immobilize.\nStabilize the injured area in the position it was found.',
  'Cold.\nApply an ice pack to the injury. This will reduce the swelling and pain.',
  'Elevate.\nElevate the injured part only if it does not cause more pain.',];

  static const List<String> strokeText = ['Think F.A.S.T. Face: is there weakness on one side of their face? Arms: can they raise both arms? Speech: is their speech easily understood? Time: to call 1990. Strokes are caused by a disruption of the blood supply to the brain. Part of the brain becomes damaged, and this can affect people\'s appearance, bodily functions, speech and sight.',
  'Immediately call 1990 or get someone else to do it. A stroke needs immediate attention, and the faster the person receives medical help, the less damage is caused.',
  'Talk to the person to reassure them while you wait for the ambulance.'];

  static const List<String> bleedingText = ['Put pressure on the wound with whatever is available to stop or slow down the flow of blood. You are acting as a \'plug\' to stop the blood escaping. The pressure you provide will help the blood clot and stop the bleeding.',
  'If the bleeding is severe, call 1990 as soon as possible, or get someone else to do it.',
  'Keep pressure on the wound until help arrives. '];

  static const List<String> brokenBoneText = ['Encourage the person to support the injury with their hand, or use a cushion or items of clothing to prevent unnecessary movement. Supporting the injury may give pain relief and prevent further damage.',
  'If the injured area is obviously deformed, significantly painful or needed for transport, call 1990 or get someone else to do it.',
  'Make sure the injury is supported until help arrives.'];

  static const List<String> heatStrokeText = [
    'The person\'s skin may be hot or red, and may also be dry or moist; they may be experiencing changes in consciousness, as well as vomiting and a high body temperature.',
    'Call 1990 as soon as possible, or get someone else to do it. Heat stroke is life-threatening.'
    'Move the person to a cooler place. Remove or loosen tight clothing and apply cool, wet clothes or towels to the skin. Fan the person. If they are conscious, give small amounts of cool water to drink. Make sure they drink slowly. Watch for changes in their condition.',
    'If needed, continue rapid cooling by applying ice or cold packs wrapped in a cloth to the wrists, ankles, groin, neck and armpits.',

  ];


  /*** Emergency text starts from here ***/

  // wildfire
  static const String wildfireHeadline = """Wildfires are unplanned fires that burn in natural areas like forests, grasslands or prairies. These dangerous fires spread quickly and can devastate not only wildfire and natural areas, but also communities.""";
  static const String tsunamiHeadline = """A tsunami can kill or injure people and damage or destroy buildings and infrastructure as waves come in and go out. A tsunami is a series of enormous ocean waves caused by earthquakes, underwater landslides, volcanic eruptions, or asteroids.""";
  static const String tornadoHeadline = """Tornadoes are violently rotating columns of air that extend from a thunderstorm to the ground. Tornadoes can destroy buildings, flip cars, and create deadly flying debris.""";
  static const String thurnderstromHeadline = """Lightning is a leading cause of injury and death from weather-related hazards. Although most lightning victims survive, people struck by lightning often report a variety of long-term, debilitating symptoms.""";
  static const String weatherHeadline = """Severe weather can happen anytime, in any part of the country. Severe weather can include hazardous conditions produced by thunderstorms, including damaging winds, tornadoes, large hail, flooding and flash flooding.""";
  static const String powerOutageHeadline = """Extended power outages may impact the whole community and the economy. A power outage is when the electrical power goes out unexpectedly.""";
  static const String pandemicHeadline = """A pandemic is a disease outbreak that spans several countries and affects a large number of people. Pandemics are most often caused by viruses, like Coronavirus Disease 2019 (COVID-19), which can easily spread from person to person. A new virus, like COVID-19, can emerge from anywhere and quickly spread around the world. It is hard to predict when or where the next new pandemic will emerge.""";

  static const String landslidesHeadline = """Landslides occur in all Sri Lanka and can be caused by many factors including earthquakes, storms, fire and human modification of land. The deadliest landslides are the ones that occur quickly, often with little notice. In a landslide, masses of rock, earth or debris move down a slope. Debris and mud flows are rivers of rock, earth and other debris saturated with water. They develop during intense rainfall, runoff, or rapid snowmelt, changing the earth into a flowing river of mud or “slurry.” They can flow rapidly, striking with little or no warning at avalanche speeds (faster than a person can run). They also can travel many miles from their source, growing in size as they pick up trees, boulders, cars and other materials. Debris flows don’t always stay in stream channels and they can flow sideways as well as downhill.
  \nWhen a wildfire burns a slope, it increases the chance of debris flows for several years. Although some landslides require lengthy rain and saturated slopes, a debris flow can start on a dry slope after only a few minutes of intense rain. “Intense” rain means a burst of rain at a fast rate, about half an inch in an hour. With debris flows, the rate matters more than total rainfall. How to protect yourself or your property depends on the type of landslide. Land-use zoning, professional inspections, and proper design can reduce many landslide problems but evacuation is often the only way to protect lives from a debris flow or other fast-moving landslide. Never ignore an evacuation order.""";

  static const String hazardousMaterialsHeadline = """Hazardous materials can include explosives, flammable and combustible substances, poisons and radioactive materials. Emergencies can happen during production, storage, transportation, use or disposal. You are at risk when chemicals are used unsafely or released in harmful amounts where you live, work or play.""";
  static const String chemicalEmergencyHeadline = """Chemical agents are poisonous vapors, aerosols, liquids and solids that have toxic effects on people, animals or plants. Chemical agents can cause death but are difficult to deliver in deadly amounts because they dissipate quickly outdoors and are hard to produce.""";
  static const String attacksHeadline = """While the threat of mass attacks is real, we can take steps to prepare, protect ourselves and help others.""";

  static const String floodsHeadline = """Flooding is a temporary overflow of water onto land that is normally dry. Failing to evacuate flooded areas or entering flood waters can lead to injury or death.""";
  static const String extremeHeatHeadline = """Extreme heat is a period of high heat and humidity with temperatures above 58 Celsius for at least two to three days. In extreme heat your body works extra hard to maintain a normal temperature, which can lead to death. In fact, extreme heat is responsible for the highest number of annual deaths among all weather-related hazards.""";
  static const String earthquakeHeadline = """An earthquake is a sudden, rapid shaking of the ground caused by the shifting of rocks deep underneath the earth’s surface. Earthquakes can cause fires, tsunamis, landslides or avalanches.""";


  static TextStyle learnMenuBookTextStyle(double factor) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      fontSize: (factor * SizeConfig.blockSizeHorizontal),
      color: Colors.black,
    );
  }

static TextStyle learnMenuTextStyle(double factor) {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    fontSize: (factor * SizeConfig.blockSizeHorizontal),
    color: Colors.black,
  );
}

  static TextStyle title1Style() {
    return TextStyle(fontSize: 20,
        fontFamily: "Roboto",
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle title2Style() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Lato',
      color: Colors.white,
    );
  }

  static TextStyle headingStyle() {
    return TextStyle(fontFamily: 'Lato',
    fontSize: 15, letterSpacing: 0.5, color: Colors.white70, fontWeight: FontWeight.bold);
  }

  static TextStyle heading2Style() {
    return TextStyle(fontFamily: 'Roboto',
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900);
  }

  static TextStyle headlineStyle() {
    return TextStyle(fontFamily: 'Lato',
        fontSize: 15,
        letterSpacing: 0.5,
        color: Colors.black,
    );
  }

  static TextStyle listParagraphTitleStyle() {
    return TextStyle(
        fontFamily: 'Lato',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.red
    );
  }

  static TextStyle listParagraphStyle() {
    return TextStyle(
      fontFamily: 'Lato',
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: Colors.black
    );
  }

  static TextStyle expansionListTitle() {
    return TextStyle(
        fontFamily: 'Roboto',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black
    );
  }

  static TextStyle expansionListText() {
    return TextStyle(
        fontFamily: 'Lato',
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black
    );
  }

  static TextStyle usefulLinkStyle() {
    return TextStyle(fontFamily: 'Lato',
      fontSize: 15,
      letterSpacing: 0.5,
      color: Colors.black,
      fontWeight: FontWeight.w900
    );
  }

  static TextStyle emergencyContactTitle() {
    return TextStyle(
      fontFamily: 'Lato',
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    );
  }

  static TextStyle homeMoreEmergencyNumTextStyle() {
    return TextStyle(
      color: Colors.redAccent,
      fontFamily: 'Montserrat',
      fontSize: 12,
      fontWeight: FontWeight.w700
    );
  }


}