import 'package:flutter/material.dart';

class PlayerInfo {
  // class constructor
  PlayerInfo(this.score, this.displayname);

  int score;
  int? pointsToAdd;
  IconData? icon;
  final String? displayname;
}
