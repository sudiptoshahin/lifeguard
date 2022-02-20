
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifeguard/pages/home.dart';
import 'package:lifeguard/util/size_config.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MaterialApp(
      title: 'LifeGuard',
      home: LaunchScreen(),
      debugShowCheckedModeBanner: false,
    )
  );
}
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}


class _LaunchScreenState extends State<LaunchScreen> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,

    )..repeat(reverse:true);
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn
    );

    _navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2500), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Scaffold(
          backgroundColor: Colors.black,
          extendBody: true,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Column(
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        lifeguardLogo(),

                      ],
                    ),
                  ),

                  Text("LifeGuard",style: TextStyle(
                    fontFamily: 'Montserrat',
                      fontSize: 25,
                      fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: ((MediaQuery.of(context).size.width / 100.0) * 40),),

              Container(
                margin: EdgeInsets.only(top: 5,),
                child: Center(child: collegeAndRedCrossLogo()),
              ),

            ],
          ),
        ),
      );
    });
  }
}

Image lifeguardLogo() {
  return Image(
    image: AssetImage('assets/images/life_guard_logo.png'),
    height: 200,
    width: 200,
  );
}

Image collegeAndRedCrossLogo() {
  return Image(
    image: AssetImage('assets/images/org_logo.png',),
    height: 120,
  );
}


