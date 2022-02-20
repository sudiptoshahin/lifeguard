import 'package:flutter/material.dart';

class FadeTransitionSplash extends StatefulWidget {
  _FadeTransitionSplashState createState() => _FadeTransitionSplashState();
}

class _FadeTransitionSplashState extends State<FadeTransitionSplash>
    with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,

    )..repeat(reverse:true);
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: 300,
        width: 300,
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              lifeguardLogo(),
              Text("Flutter Dev's",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
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