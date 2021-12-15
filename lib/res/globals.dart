library game_saver.globals;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/game_info.dart';
import 'package:game_saver/res/player_info.dart';
import 'package:game_saver/res/strings.dart';

//Game Options Page
bool gameOptionDefaultTimerON = false;
bool gameOptionDefaultScoreLOW = false;
bool gameOptionEndRoundOnPlayer = false;
bool gameOption4 = false;
bool gameOption5 = false;
bool gameOption6 = false;
bool gameOption7 = false;

enum HighLowOptions {high, low}

//Game list for leaderboard
List<GameInfo> gameList = [ GameInfo([PlayerInfo( 69, 'Josh')]) ];

GameInfo? currentGame;

List<Widget> topScores = [ PlayerScoreWidget(gameList[0].players[0])]; //Initialize with fake player

class PlayerScoreWidget extends StatelessWidget {
  const PlayerScoreWidget(this.info, {Key? key}) : super(key: key);

  final PlayerInfo info;

  @override
  Widget build(BuildContext context) {
    String displayName = info.displayname.toString();
    String score = info.points.toString();

    if (currentGame != null)
    {
      info.icon ??= currentGame!.highlowOption == HighLowOptions.high ? Icons.arrow_upward_sharp : Icons.arrow_downward_sharp;
    }
    else
    {
      info.icon = Icons.arrow_upward_sharp;
    }

    return InkWell( // Enables taps for child and add ripple effect when child widget is long pressed.
      child: ListTile( // Useful standard widget for displaying something in ListView.
        leading: Icon(info.icon),
        title: Text("Player: $displayName                           Score: $score"),
      )
    );
  }
}

showAlertDialog(BuildContext context, String message) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text(ProjectStrings.ok),
    onPressed: () => { Navigator.of(context).pop() },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(ProjectStrings.error),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}