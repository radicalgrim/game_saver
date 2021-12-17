import 'package:game_saver/pages/add_players_page.dart';
import 'package:game_saver/pages/scoreboard.dart';
import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';
import 'package:page_transition/page_transition.dart';

class EndOfGamePage extends StatefulWidget {
  const EndOfGamePage({Key? key}) : super(key: key);
  static const String route = "/endofgame";
  @override
  EndOfGamePageState createState() => EndOfGamePageState();
}

class EndOfGamePageState extends State<EndOfGamePage> {
  String roundTitle() {
    var roundTime = globals.currentGame!.elapsedTime;
    return (globals.currentGame!.showTimer
            ? "Total Game Time: $roundTime"
            : "") +
        "\n\nHonorable Mentions";
  }

  //PAGE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        title: Text((globals.currentGame!.name as String) + " Finished"),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(ProjectStrings.eofGameTitle,
                      style: ProjectTextStyles.pageTitleTextStyle),
                ),
                Container(
                  height: 90,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                      color: ProjectColors.primarySwatch.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Center(
                    child: Column(
                      children: [
                        ListView.builder(
                          // Widget which creates [ItemWidget] in scrollable list.
                          shrinkWrap: true,
                          itemCount: 1, // Number of widget to be created.
                          itemBuilder: (context,
                                  itemIndex) => // Builder function for every item with index.
                              globals.currentGame!.getWinner(),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: timerHeight),
                  child: Text(roundTitle(),
                      style: ProjectTextStyles.pageTitle2TextStyle),
                ),
                getHonorableMentionsWidget(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        child: const Text(ProjectStrings.eofGameScoreboards,
                            style: ProjectTextStyles.buttonStandardTextStyle),
                        onPressed: () {
                          scoreboards();
                        },
                      ),
                      ElevatedButton(
                        child: const Text(ProjectStrings.eofGameNewGame,
                            style: ProjectTextStyles.buttonStandardTextStyle),
                        onPressed: () {
                          newGame();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  scoreboards() {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(
        context,
        PageTransition(
            child: const ScoreboardPage(), type: PageTransitionType.fade));
  }

  newGame() {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(
        context,
        PageTransition(
            child: const AddPlayersPage(), type: PageTransitionType.fade));
  }

  var timerHeight = 56 - (globals.currentGame!.showTimer ? 0 : 56).toDouble();

  Widget getHonorableMentionsWidget() {
    if (globals.currentGame!.totalPlayers() != 1) {
      return Container(
        height: 80 * (globals.currentGame!.totalPlayers() - 1).toDouble(),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
            color: ProjectColors.primarySwatch.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Column(
            children: [
              ListView.builder(
                // Widget which creates [ItemWidget] in scrollable list.
                shrinkWrap: true,
                itemCount: globals.currentGame!.totalPlayers() -
                    1, // Number of widget to be created.
                itemBuilder: (context,
                        itemIndex) => // Builder function for every item with index.
                    globals.currentGame!.getPlayersByRank(),
              )
            ],
          ),
        ),
      );
    } else {
      return const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0));
    }
  }
}
