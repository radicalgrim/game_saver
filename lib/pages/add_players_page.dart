import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/player_info.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';

class AddPlayersPage extends StatefulWidget {
  const AddPlayersPage({Key? key}) : super(key: key);
  static const String route = "/players";
  @override
  AddPlayersPageState createState() => AddPlayersPageState();
}

class AddPlayersPageState extends State<AddPlayersPage> {
  List<Widget> playerInfo = [];
  String inputValue = "";
  final fieldText = TextEditingController();

  void addPlayerInfo(String value)
  {
    setState(() {
      playerInfo.add(ItemWidget(PlayerInfo(0, value)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        // TODO: What text do we want in the app bar, if any?
        title: const Text(ProjectStrings.appTitle),
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
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(ProjectStrings.addPlayersHeading,
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              
              Container(
                // TODO: Add draggable player cards
                width: 350,
                height: 400,
                color: ProjectColors.primarySwatch.shade100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListView.builder( // Widget which creates [ItemWidget] in scrollable list.
                        shrinkWrap: true,
                        itemCount: playerInfo.length, // Number of widget to be created.
                        itemBuilder: (context, itemIndex) => // Builder function for every item with index.
                            playerInfo[itemIndex],
                      )
                    ],
                  )
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: 
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.add_circle),
                        hintText: 'Display Name',
                        labelText: 'Display Name *',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      ),
                      onChanged: (String value) {
                        inputValue = value;
                      },
                      controller: fieldText,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    color: ProjectColors.primarySwatch.shade700,
                    onPressed: () {
                      addPlayerInfo(inputValue);
                      inputValue = "";
                      fieldText.clear();
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

class ItemWidget extends StatelessWidget {
  const ItemWidget(this.info, {Key? key}) : super(key: key);

  final PlayerInfo info;

  @override
  Widget build(BuildContext context) {
    return InkWell( // Enables taps for child and add ripple effect when child widget is long pressed.
      child: ListTile( // Useful standard widget for displaying something in ListView.
        leading: Icon(info.icon),
        title: Text(info.displayname.toString()),
      )
    );
  }
}
