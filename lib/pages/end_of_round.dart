import 'dart:developer';

import 'package:game_saver/pages/round_x_page.dart';
import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';
import 'package:page_transition/page_transition.dart';


class EndOfRound extends StatefulWidget {
  const EndOfRound({Key? key}) : super(key: key);
  static const String route = "/endofround";
  @override
  EndOfRoundState createState() => EndOfRoundState();
}

class EndOfRoundState extends State<EndOfRound> {
  final fieldText = TextEditingController();

  final int roundNum = globals.currentGame!.round + 1;

  String roundTime = globals.currentGame!.elapsedTime;

  void changeScoresButton()
  {
    globals.currentGame!.currentPlayer = 0;
    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const RoundXPage()));
  }

  void nextRound()
  {
    globals.currentGame!.round++;
    globals.currentGame!.currentPlayer = 0;
    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const RoundXPage()));
  }

  //PAGE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        title: const Text(ProjectStrings.eofRoundHeader),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Text("Round $roundNum\nCurrent Elapsed Time: $roundTime",
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              Container(
                child: 
                Center(child: 
                  Column(children: [
                      ListView.builder( // Widget which creates [ItemWidget] in scrollable list.
                        shrinkWrap: true,
                        itemCount: globals.currentGame!.totalPlayers(), // Number of widgets to be created.
                        itemBuilder: (context, itemIndex) => // Builder function for every item with index.
                            globals.currentGame!.playersView[itemIndex],
                      )
                  ],),
                ),
                width: 350,
                height: 400,
                color: ProjectColors.primarySwatch.shade100,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: const EdgeInsets.fromLTRB(25, 200, 0, 0),
                        child:  
                          ElevatedButton(
                            child: const Text(ProjectStrings.eofRoundChange,
                                style: ProjectTextStyles.buttonLargeTextStyle),
                            onPressed: () {
                              changeScoresButton();
                            },
                          ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20, 200, 0, 0),
                        child:  
                          ElevatedButton(
                            child: const Text(ProjectStrings.eofRoundNext,
                                style: ProjectTextStyles.buttonLargeTextStyle),
                            onPressed: () {
                              nextRound();
                            },
                          ),
                      )
                  ],)
                ],
              ),
              Padding(padding: const EdgeInsets.fromLTRB(20, 150, 0, 0),
                child: 
                  ElevatedButton(
                    child: const Text(ProjectStrings.eofGameButton,
                        style: ProjectTextStyles.buttonLargeTextStyle),
                    onPressed: () {
                      globals.currentGame!.setTime();
                      globals.currentGame!.stopWatch();

                      // TODO -> go to end of game page
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