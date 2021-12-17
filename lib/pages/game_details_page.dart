import 'package:game_saver/res/game_info.dart';
import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';

class GameDetailsPage extends StatelessWidget {
  final GameInfo game;

  const GameDetailsPage({required this.game, Key? key}) : super(key: key);
  static const String route = "/game_details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        title: const Text(ProjectStrings.appTitle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Text(ProjectStrings.gameDetailsHeader,
                      style: ProjectTextStyles.pageTitleTextStyle),
                ),
                Container(
                  height: 400,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                      color: ProjectColors.primarySwatch.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 80 * (game.totalPlayers()).toDouble(),
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          decoration: BoxDecoration(
                              color: ProjectColors.primarySwatch.shade100,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: Column(
                              children: [
                                ListView.builder(
                                    // Widget which creates [ItemWidget] in scrollable list.
                                    shrinkWrap: true,
                                    itemCount: game.players.length,
                                    itemBuilder: (context,
                                            itemIndex) => // Builder function for every item with index.
                                        game.getPlayersByRank())
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
