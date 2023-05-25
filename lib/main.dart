import 'package:flutter/material.dart';
import 'package:weather_app/screens/landing_page/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Application',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 32,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        fontFamily: 'MontserratAlternates',
      ),
      home: const SplashScreen(),
    );
  }
}
