import 'package:game_saver/res/globals.dart';
import 'package:game_saver/res/player_info.dart';

class GameInfo {

  GameInfo(this.players);

  List<PlayerInfo> players = [];
  PlayerInfo? winner;
  String? name;

  bool showTimer = false;
  HighLowOptions? highlowOption = HighLowOptions.high;
}