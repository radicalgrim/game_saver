import 'dart:developer';
import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';

class GameOptionsPage extends StatefulWidget {
  const GameOptionsPage({Key? key}) : super(key: key);
  static const String route = "/gameoptions";
  @override
  GameOptionsPageState createState() => GameOptionsPageState();
}

class GameOptionsPageState extends State<GameOptionsPage> {
  //PAGE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        title: const Text(ProjectStrings.gameOptionsHeader),
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
                child: Text(ProjectStrings.gameOptionsTitle,
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              Container(
                child: Column(children: [
                  CheckboxListTile(
                    title: const Text(ProjectStrings.gameOptionDefaultTimerON),
                    value: globals.gameOptionDefaultTimerON, 
                    onChanged: (bool? value) {
                      setState(() {
                        globals.gameOptionDefaultTimerON = value!;
                      });
                    }),
                    CheckboxListTile(
                    title: const Text(ProjectStrings.gameOptionDefaultScoreLOW),
                    value: globals.gameOptionDefaultScoreLOW, 
                    onChanged: (bool? value) {
                      setState(() {
                        globals.gameOptionDefaultScoreLOW = value!;
                      });
                    }),
                    CheckboxListTile(
                    title: const Text(ProjectStrings.gameOptionEndRoundOnPlayer),
                    value: globals.gameOptionEndRoundOnPlayer, 
                    onChanged: (bool? value) {
                      setState(() {
                        globals.gameOptionEndRoundOnPlayer = value!;
                      });
                    }),
                    CheckboxListTile(
                    title: const Text(ProjectStrings.gameOption4),
                    value: globals.gameOption4, 
                    onChanged: (bool? value) {
                      setState(() {
                        globals.gameOption4 = value!;
                      });
                    }),
                    CheckboxListTile(
                    title: const Text(ProjectStrings.gameOption5),
                    value: globals.gameOption5, 
                    onChanged: (bool? value) {
                      setState(() {
                        globals.gameOption5 = value!;
                      });
                    }),
                    CheckboxListTile(
                    title: const Text(ProjectStrings.gameOption6),
                    value: globals.gameOption6, 
                    onChanged: (bool? value) {
                      setState(() {
                        globals.gameOption6 = value!;
                      });
                    }),
                    CheckboxListTile(
                    title: const Text(ProjectStrings.gameOption7),
                    value: globals.gameOption7, 
                    onChanged: (bool? value) {
                      setState(() {
                        globals.gameOption7 = value!;
                      });
                    }),
                ],),
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
