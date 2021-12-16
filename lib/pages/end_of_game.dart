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

  String roundTitle()
  {
    var roundTime = globals.currentGame!.elapsedTime;
    return (globals.currentGame!.showTimer ? "Total Game Time: $roundTime" : "") + "\n\nHonorable Mentions";
  }

  scoreboards() {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(context, PageTransition(child: const ScoreboardPage(), type: PageTransitionType.fade));
  }

  newGame() {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(context, PageTransition(child: const AddPlayersPage(), type: PageTransitionType.fade));
  }

  var timerHeight = (56 - (globals.currentGame!.showTimer ? 0 : 56)) as double;

  Widget getHonorableMentionsWidget()
  {
    if (globals.currentGame!.totalPlayers() != 1)
    {
      return Container(
              child: 
                Center(child: 
                  Column(children: [
                      ListView.builder( // Widget which creates [ItemWidget] in scrollable list.
                          shrinkWrap: true,
                          itemCount: globals.currentGame!.totalPlayers() - 1, // Number of widget to be created.
                          itemBuilder: (context, itemIndex) => // Builder function for every item with index.
                              globals.currentGame!.getPlayersByRank(),
                        )
                  ],),
                ),
              width: 350,
              height: (70 * (globals.currentGame!.totalPlayers() - 1)) as double,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              color: ProjectColors.primarySwatch.shade100,
            );
    }
    else
    {
      return const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0));
    }
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Text(ProjectStrings.eofGameTitle,
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              Container(
                child: 
                Center(child: 
                  Column(children: [
                      ListView.builder( // Widget which creates [ItemWidget] in scrollable list.
                          shrinkWrap: true,
                          itemCount: 1, // Number of widget to be created.
                          itemBuilder: (context, itemIndex) => // Builder function for every item with index.
                              globals.currentGame!.getWinner(),
                        )
                  ],),
                ),
                width: 350,
                height: 70,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                color: ProjectColors.primarySwatch.shade100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: timerHeight, horizontal: 20),
                child: Text(roundTitle(), style: ProjectTextStyles.pageTitleTextStyle),
              ),
              getHonorableMentionsWidget(),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: const EdgeInsets.fromLTRB(25, 50, 0, 0),
                        child:  
                          ElevatedButton(
                            child: const Text(ProjectStrings.eofGameScoreboards,
                                style: ProjectTextStyles.buttonLargeTextStyle),
                            onPressed: () {
                              scoreboards();
                            },
                          ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                        child:  
                          ElevatedButton(
                            child: const Text(ProjectStrings.eofGameNewGame,
                                style: ProjectTextStyles.buttonLargeTextStyle),
                            onPressed: () {
                              newGame();
                            },
                          ),
                      )
                  ],)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}