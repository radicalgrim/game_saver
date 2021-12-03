import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({Key? key}) : super(key: key);
  static const String route = "/gamecustomization";
  @override
  ScoreboardPageState createState() => ScoreboardPageState();
}

class ScoreboardPageState extends State<ScoreboardPage> {
  //PAGE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        title: const Text(ProjectStrings.scoreboardHeader),
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
                child: Text(ProjectStrings.scoreboardPreviousGames,
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              Container(
                child: 
                Center(child: 
                  Column(children: [
                      ListView.builder( // Widget which creates [ItemWidget] in scrollable list.
                          shrinkWrap: true,
                          itemCount: globals.topScores.length, // Number of widget to be created.
                          itemBuilder: (context, itemIndex) => // Builder function for every item with index.
                              globals.topScores[itemIndex],
                        )
                  ],),
                ),
                width: 350,
                height: 400,
                color: ProjectColors.primarySwatch.shade100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}