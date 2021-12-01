import 'package:flutter/material.dart';
import 'package:game_saver/pages/add_players_page.dart';
import 'package:game_saver/pages/flutter_demo_page.dart';
import 'package:game_saver/pages/home_page.dart';
import 'package:game_saver/res/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'game_saver',
      theme: ThemeData(
        primarySwatch: ProjectColors.primarySwatch,
      ),
      home: const HomePage(),
      routes: {
        HomePage.route: (_) => const HomePage(),
        AddPlayersPage.route: (_) => const AddPlayersPage(),
        FlutterDemoPage.route: (_) => const FlutterDemoPage(),
      },
    );
  }
}
