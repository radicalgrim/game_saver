library game_saver.globals;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/game_info.dart';
import 'package:game_saver/res/player_info.dart';

//Game Options Page
bool gameOption1 = false;
bool gameOption2 = false;
bool gameOption3 = false;
bool gameOption4 = false;
bool gameOption5 = false;
bool gameOption6 = false;
bool gameOption7 = false;

//Game list for leaderboard
List<GameInfo> gameList = [ GameInfo([PlayerInfo( 69, 'Josh')]) ];

GameInfo? currentGame;

List<Widget> topScores = [ PlayerScoreWidget(gameList[0].players[0]) ]; //Initialize with fake player

class PlayerScoreWidget extends StatelessWidget {
  const PlayerScoreWidget(this.info, {Key? key}) : super(key: key);

  final PlayerInfo info;

  @override
  Widget build(BuildContext context) {
    String displayName = info.displayname.toString();
    String score = info.points.toString();
    return InkWell( // Enables taps for child and add ripple effect when child widget is long pressed.
      child: ListTile( // Useful standard widget for displaying something in ListView.
        leading: Icon(info.icon),
        title: Text("$displayName  -  $score"),
      )
    );
  }
}