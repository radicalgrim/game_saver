import 'dart:developer';

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
  //PARAMETERS
  bool? enableGameTimer = false;

  //PAGE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        // TODO: What text do we want in the app bar, if any?
        title: const Text(ProjectStrings.gameOptionsHeader),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // TODO: Make the page structure look a bit better
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Text(ProjectStrings.gameOptionsTitle,
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              Container(
                child: Column(children: [
                  CheckboxListTile(
                    title: const Text(ProjectStrings.gameOptionGameTimer),
                    value: enableGameTimer, 
                    onChanged: (bool? value) {
                      setState(() {
                        enableGameTimer = value;
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
