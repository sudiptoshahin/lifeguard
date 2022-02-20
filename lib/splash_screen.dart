import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lifeguard/pages/home.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: lifeguardLogo(),
      duration: 3000,
      backgroundColor: Colors.black,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.scale, nextScreen: Home(),
      splashIconSize: 100,
    );
  }
}




Image lifeguardLogo() {
  return Image(
    image: AssetImage('assets/images/life_guard_logo.png'),
    height: 180,
    width: 180,
  );
}