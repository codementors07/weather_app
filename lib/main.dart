import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
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
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
      ),
      home: HomePage(),
    );
  }
}