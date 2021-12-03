import 'package:flutter/cupertino.dart';
import 'package:game_saver/res/globals.dart';
import 'package:game_saver/res/player_info.dart';

class GameInfo {

  GameInfo(this.players);

  List<PlayerInfo> players = [];
  PlayerInfo? winner;
  String? name;

  int round = 0;
  
  int currentPlayer = 0;
  int totalPlayers() => players.length;

  bool showTimer = false;
  HighLowOptions? highlowOption = HighLowOptions.high;

  List<Widget> playersView = [];
  // ignore: avoid_function_literals_in_foreach_calls
  void initPlayers() => { players.forEach((element) { playersView.add(PlayerScoreWidget(element)); }) };
}