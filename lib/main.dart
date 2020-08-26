import 'package:flutter/material.dart';
import 'package:new_cal/ui.dart';
import 'package:flutter/services.dart' ;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cal_UI(),
    );
  }
}