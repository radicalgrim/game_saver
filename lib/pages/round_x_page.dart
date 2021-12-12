import 'dart:developer';

import 'package:game_saver/pages/end_of_round.dart';
import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';
import 'package:page_transition/page_transition.dart';

class RoundXPage extends StatefulWidget {
  const RoundXPage({Key? key}) : super(key: key);
  static const String route = "/rounds";
  @override
  RoundXPageState createState() => RoundXPageState();
}

class RoundXPageState extends State<RoundXPage> {
  final fieldText = TextEditingController();

  final int roundNum = globals.currentGame!.round + 1;
  final int playerIndex = globals.currentGame!.currentPlayer;

  int score = 0;

  void previousPlayer() {
    globals.currentGame!.currentPlayer = globals.currentGame!.currentPlayer - 1;
    if (globals.currentGame!.currentPlayer < 0) {
      globals.currentGame!.currentPlayer =
          globals.currentGame!.totalPlayers() - 1;
    }
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade, child: const RoundXPage()));
  }

  void nextPlayer() {
    globals.currentGame!.currentPlayer =
        (globals.currentGame!.currentPlayer + 1) %
            globals.currentGame!.totalPlayers();
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade, child: const RoundXPage()));
  }

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
      /*
      appBar: AppBar(
        title: Text(globals.currentGame!.name as String),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      */
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Text("Round $roundNum",
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      ListView.builder(
                        // Widget which creates [ItemWidget] in scrollable list.
                        shrinkWrap: true,
                        itemCount: 1, // Number of widgets to be created.
                        itemBuilder: (context,
                                itemIndex) => // Builder function for every item with index.
                            globals.currentGame!.playersView[playerIndex],
                      )
                    ],
                  ),
                ),
                width: 350,
                height: 50,
                color: ProjectColors.primarySwatch.shade100,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(130, 10, 0, 0),
                    child: SizedBox(
                      width: 100,
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: ProjectStrings.roundInputExample,
                          labelText: ProjectStrings.roundInput,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                        ),
                        onChanged: (String value) {
                          score = int.parse(value);
                        },
                        controller: fieldText,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: IconButton(
                        icon: const Icon(Icons.add_circle),
                        color: ProjectColors.primarySwatch.shade700,
                        onPressed: () {
                          if (score != 0) {
                            globals.currentGame!.players[playerIndex].points +=
                                score;
                            score = 0;
                            fieldText.clear();
                            nextPlayer();
                          }
                        },
                      )),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 200, 0, 0),
                        child: ElevatedButton(
                          child: const Text(ProjectStrings.roundPrevious,
                              style: ProjectTextStyles.buttonLargeTextStyle),
                          onPressed: () {
                            previousPlayer();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 200, 0, 0),
                        child: ElevatedButton(
                          child: const Text(ProjectStrings.roundNext,
                              style: ProjectTextStyles.buttonLargeTextStyle),
                          onPressed: () {
                            nextPlayer();
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 150, 0, 0),
                child: ElevatedButton(
                  child: const Text(ProjectStrings.roundEnd,
                      style: ProjectTextStyles.buttonLargeTextStyle),
                  onPressed: () {
                    globals.currentGame!.setTime();
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const EndOfRound()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
