import 'package:flutter/material.dart';
import 'package:game_saver/pages/flutter_demo_page.dart';
import 'package:game_saver/pages/home_page.dart';
import 'package:game_saver/res/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'game_saver',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: ProjectColors.primarySwatch,
      ),
      // This tells flutter the home page of your application
      home: const FlutterDemoPage(),
      // This tells flutter the different pages in your application
      routes: {
        HomePage.route: (_) => const HomePage(),
        FlutterDemoPage.route: (_) => const FlutterDemoPage(),
      },
    );
  }
}
