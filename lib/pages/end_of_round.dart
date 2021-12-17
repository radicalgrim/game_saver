import 'dart:developer';

import 'package:game_saver/pages/end_of_game.dart';
import 'package:game_saver/pages/round_x_page.dart';
import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';
import 'package:page_transition/page_transition.dart';

class EndOfRoundPage extends StatefulWidget {
  const EndOfRoundPage({Key? key}) : super(key: key);
  static const String route = "/endofround";
  @override
  EndOfRoundPageState createState() => EndOfRoundPageState();
}

class EndOfRoundPageState extends State<EndOfRoundPage> {
  final fieldText = TextEditingController();

  final int roundNum = globals.currentGame!.round + 1;

  String roundTime = globals.currentGame!.elapsedTime;

  int height = 80 * globals.currentGame!.totalPlayers();

  //PAGE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        title: const Text(ProjectStrings.appTitle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(roundTitle(),
                      style: ProjectTextStyles.pageTitleTextStyle),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ProjectColors.primarySwatch.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  height: height.toDouble(),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Center(
                    child: ListView.builder(
                      // Widget which creates [ItemWidget] in scrollable list.
                      shrinkWrap: true,
                      itemCount: globals.currentGame!
                          .totalPlayers(), // Number of widgets to be created.
                      itemBuilder: (context,
                              itemIndex) => // Builder function for every item with index.
                          globals.currentGame!.playersView[itemIndex],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        child: const Text(ProjectStrings.eofRoundChange,
                            style: ProjectTextStyles.buttonStandardTextStyle),
                        onPressed: () {
                          changeScoresButton();
                        },
                      ),
                      ElevatedButton(
                        child: const Text(ProjectStrings.eofRoundNext,
                            style: ProjectTextStyles.buttonStandardTextStyle),
                        onPressed: () {
                          nextRound();
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: ElevatedButton(
                    child: const Text(ProjectStrings.eofGameButton,
                        style: ProjectTextStyles.buttonStandardTextStyle),
                    onPressed: () {
                      globals.currentGame!.setTime();
                      globals.currentGame!.stopWatch();
                      endGame();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeScoresButton() {
    globals.currentGame!.currentPlayer = 0;
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade, child: const RoundXPage()));
  }

  String roundTitle() {
    return "Round $roundNum" +
        (globals.currentGame!.showTimer ? "\nRound Time: $roundTime" : "");
  }

  void nextRound() {
    globals.currentGame!.round++;
    globals.currentGame!.currentPlayer = 0;
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade, child: const RoundXPage()));
  }

  void endGame() {
    globals.currentGame!.setTime();
    globals.currentGame!.stopWatch();
    globals.gameList.add(globals.currentGame);
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade, child: const EndOfGamePage()));
  }
}
