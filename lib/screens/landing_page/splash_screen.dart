import 'package:flutter/material.dart';

import '../../config/asset_images.dart';
import 'onboarding_scren.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //splash screen
  void init(context) async {
    await Future.delayed(const Duration(seconds: 5), () {
      return Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blue.shade200,
        Colors.blue,
        Colors.blue.shade700,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetPath.weatherLogo,
            height: 125,
            width: 125,
          ),
        ],
      ),
    );
  }
}
