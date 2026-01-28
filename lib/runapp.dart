import 'package:flutter/material.dart';
import 'package:my_intro_card/screen/home_screen.dart';

class IntroCard extends StatelessWidget {
  const IntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Introduction Card",
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
