import 'package:flutter/material.dart';
import 'package:study1/my_demo_theme.dart';
import 'package:study1/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: buildLightTheme(),
      home: SplashScreen(),
    );
  }
}
