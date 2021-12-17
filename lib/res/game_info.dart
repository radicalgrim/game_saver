import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_saver/res/globals.dart';
import 'package:game_saver/res/player_info.dart';

class GameInfo {
  GameInfo({required this.players, this.name, this.timestamp});

  List<PlayerInfo> players = [];
  List<PlayerInfo> displayedPlayers = [];
  PlayerInfo? winner;
  String? name;
  DateTime? timestamp = DateTime.now();

  int round = 0;

  int currentPlayer = 0;
  int totalPlayers() => players.length;

  bool showTimer = gameOptionDefaultTimerON;
  HighLowOptions highlowOption =
      gameOptionDefaultScoreLOW ? HighLowOptions.low : HighLowOptions.high;

  List<Widget> playersView = [];
  // ignore: avoid_function_literals_in_foreach_calls
  void initPlayers() => {
        players.forEach((element) {
          playersView.add(PlayerScoreWidget(element));
        })
      };

  Widget getWinner() {
    if (highlowOption == HighLowOptions.high) {
      winner = PlayerInfo(-1, "error");
      // ignore: avoid_function_literals_in_foreach_calls
      players.forEach((x) => winner = (x.score > winner!.score ? x : winner));
    } else {
      winner = PlayerInfo(1000000, "error");
      // ignore: avoid_function_literals_in_foreach_calls
      players.forEach((x) => winner = (x.score < winner!.score ? x : winner));
    }

    displayedPlayers.add(winner as PlayerInfo);
    return PlayerScoreWidget(winner as PlayerInfo);
  }

  Widget getPlayersByRank() {
    PlayerInfo honorableMention;
    if (highlowOption == HighLowOptions.high) {
      honorableMention = PlayerInfo(-1, "error");
      // ignore: avoid_function_literals_in_foreach_calls
      players.forEach((x) => honorableMention =
          ((!displayedPlayers.contains(x) && x.score > honorableMention.score)
              ? x
              : honorableMention));
    } else {
      honorableMention = PlayerInfo(1000000, "error");
      // ignore: avoid_function_literals_in_foreach_calls
      players.forEach((x) => honorableMention =
          ((!displayedPlayers.contains(x) && x.score < honorableMention.score)
              ? x
              : honorableMention));
    }
    displayedPlayers.add(honorableMention);
    return PlayerScoreWidget(honorableMention);
  }

  Stopwatch watch = Stopwatch();
  Timer? timer;
  bool startStop = true;

  String elapsedTime = '';

  updateTime(Timer timer) {
    if (watch.isRunning) {
      elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
    }
  }

  startOrStop() {
    if (startStop) {
      startWatch();
    } else {
      stopWatch();
    }
  }

  startWatch() {
    startStop = false;
    watch.start();
    timer = Timer.periodic(const Duration(milliseconds: 100), updateTime);
  }

  stopWatch() {
    startStop = true;
    watch.stop();
    setTime();
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    elapsedTime = transformMilliSeconds(timeSoFar);
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
