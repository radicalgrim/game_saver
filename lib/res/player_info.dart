import 'package:flutter/material.dart';

class PlayerInfo {
  // class constructor
  PlayerInfo(this.score, this.displayname);

  int score;
  IconData? icon;
  final String? displayname;
}
