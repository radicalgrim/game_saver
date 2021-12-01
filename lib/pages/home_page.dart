import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/pages/add_players_page.dart';
import 'package:game_saver/pages/game_options_page.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String route = "/home";
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      // TODO: Make the page structure look a bit better
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 120),
                child: Text(ProjectStrings.appTitle,
                    style: ProjectTextStyles.appTitleTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  child: const Text(ProjectStrings.newGameButton,
                      style: ProjectTextStyles.buttonLargeTextStyle),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddPlayersPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  child: const Text(ProjectStrings.scoreboardsButton,
                      style: ProjectTextStyles.buttonLargeTextStyle),
                  onPressed: () {
                    // TODO: Implement me
                    log("Scoreboards pressed");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  color: ProjectColors.primarySwatch.shade700,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameOptionsPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
