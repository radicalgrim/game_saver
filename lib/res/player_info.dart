import 'package:flutter/material.dart';

class PlayerInfo {
 // class constructor
 PlayerInfo(this.points, this.displayname);

 int points;
 final IconData icon = Icons.star; //If we want to add user icons
 final String? displayname;
}