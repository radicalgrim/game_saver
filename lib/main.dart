import 'package:flutter/material.dart';
import 'package:game_saver/pages/add_players_page.dart';
import 'package:game_saver/pages/customize_game_page.dart';
import 'package:game_saver/pages/end_of_game.dart';
import 'package:game_saver/pages/end_of_round.dart';
import 'package:game_saver/pages/game_details_page.dart';
import 'package:game_saver/pages/game_options_page.dart';
import 'package:game_saver/pages/home_page.dart';
import 'package:game_saver/pages/round_x_page.dart';
import 'package:game_saver/pages/scoreboard.dart';
import 'package:game_saver/res/colors.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'game_saver',
      theme: ThemeData(
        primarySwatch: ProjectColors.primarySwatch,
      ),
      home: const HomePage(),
      routes: {
        AddPlayersPage.route: (_) => const AddPlayersPage(),
        CustomizeGamePage.route: (_) => const CustomizeGamePage(),
        EndOfGamePage.route: (_) => const EndOfGamePage(),
        EndOfRoundPage.route: (_) => const EndOfRoundPage(),
        GameOptionsPage.route: (_) => const GameOptionsPage(),
        RoundXPage.route: (_) => const RoundXPage(),
        ScoreboardPage.route: (_) => const ScoreboardPage(),
      },
    );
  }
}
