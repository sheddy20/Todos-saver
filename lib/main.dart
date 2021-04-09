import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SocialApe",
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red.shade800,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // brightness: Brightness.dark,
      ),
      home: App(),
    );
  }
}
