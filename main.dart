import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main() {
  runApp(CinepolisApp());
}

class CinepolisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
