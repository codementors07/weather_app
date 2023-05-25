import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade400,
        body: Column(
          children: [
            ClipPath(
              clipper: WaveClipperOne(reverse: true, flip: true),
              child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.blue.shade200,
                        Colors.blue.shade400,
                      ])),
                  child: Column(
                    children: const [],
                  )),
            ),
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.blue.shade400,
                        Colors.blue.shade200,
                      ])),
                  child: Column(
                    children: const [],
                  )),
            ),
          ],
        ));
  }
}
