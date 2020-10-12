import 'package:flutter/material.dart';
import 'package:lahaus_brokers1/src/pages/initial_page.dart';
import 'package:lahaus_brokers1/src/pages/photoKitchen_page.dart';
import 'package:lahaus_brokers1/src/pages/phototour_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Haus Brokers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF00DBB3)),
      initialRoute: 'introslide',
      routes: {
        'introslide': (BuildContext context) => IntroSlide(),
        'phototour': (BuildContext context) => PhotoTourPage(),
        'phototourKitchen': (BuildContext context) => PhotoKitchen(),
      },
    );
  }
}
