library game_saver.globals;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/game_info.dart';
import 'package:game_saver/res/player_info.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';
import 'package:intl/intl.dart';

import 'colors.dart';

//Game Options Page
bool gameOptionDefaultTimerON = false;
bool gameOptionDefaultScoreLOW = false;
bool gameOptionEndRoundOnPlayer = false;
bool gameOption4 = false;
bool gameOption5 = false;
bool gameOption6 = false;
bool gameOption7 = false;

enum HighLowOptions { high, low }

//Game list for leaderboard
List<GameInfo?> gameList = [
  GameInfo(
      players: [PlayerInfo(69, 'Josh'), PlayerInfo(42, 'Hagrid')],
      name: "A Preloaded Dummy Game",
      timestamp: DateTime.now())
];

GameInfo? currentGame;

List<Widget> topScores = [
  PlayerScoreWidget(gameList[0]?.players[0])
]; //Initialize with fake player

List<Widget> gameListDisplay = [
  GameDisplayWidget(gameList[0])
]; //Initialize with fake game

class GameDisplayWidget extends StatelessWidget {
  const GameDisplayWidget(this.info, {Key? key}) : super(key: key);

  final GameInfo? info;

  @override
  Widget build(BuildContext context) {
    final displayName = info?.name.toString();
    final timestamp = info?.timestamp;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Column(
        children: [
          SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => {},
                  child: Text(
                    displayName!,
                    style: ProjectTextStyles.buttonLargeTextStyle,
                  ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                formatTimestamp(timestamp),
                style: ProjectTextStyles.playerScoreHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerScoreWidget extends StatelessWidget {
  const PlayerScoreWidget(this.info, {Key? key}) : super(key: key);

  final PlayerInfo? info;

  @override
  Widget build(BuildContext context) {
    String? displayName = info?.displayname.toString();
    String? score = info?.score.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Current Player",
                style: ProjectTextStyles.playerScoreHintTextStyle,
              ),
              Text(
                "Score",
                style: ProjectTextStyles.playerScoreHintTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                displayName!,
                style: ProjectTextStyles.playerScoreTextStyle,
              ),
              Text(
                score!,
                style: ProjectTextStyles.playerScoreTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String formatTimestamp(DateTime? timestamp) {
  final DateFormat formatter = DateFormat('MMM. dd, yyyy  h:m');
  return formatter.format(timestamp!);
}

showAlertDialog(BuildContext context, String message) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text(ProjectStrings.ok),
    onPressed: () => {Navigator.of(context).pop()},
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
