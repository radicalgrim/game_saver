import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';

class AddPlayersPage extends StatefulWidget {
  const AddPlayersPage({Key? key}) : super(key: key);

  static const String route = "/players";

  @override
  AddPlayersPageState createState() => AddPlayersPageState();
}

class AddPlayersPageState extends State<AddPlayersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        title: const Text(ProjectStrings.appTitle),
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
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(ProjectStrings.addPlayersHeading,
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              Container(
                width: 350,
                height: 400,
                color: ProjectColors.primarySwatch.shade100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 300,
                    height: 25,
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    color: ProjectColors.primarySwatch.shade700,
                    onPressed: () {
                      // TODO: Implement me
                      log("Add Player icon pressed");
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  child: const Text(ProjectStrings.nextButton,
                      style: ProjectTextStyles.buttonLargeTextStyle),
                  onPressed: () {
                    // TODO: Implement me
                    log("Next button pressed");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
