import 'dart:developer';

import 'package:game_saver/pages/customize_game_page.dart';
import 'package:game_saver/res/game_info.dart';
import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/player_info.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:reorderables/reorderables.dart';

class AddPlayersPage extends StatefulWidget {
  const AddPlayersPage({Key? key}) : super(key: key);
  static const String route = "/players";
  @override
  AddPlayersPageState createState() => AddPlayersPageState();
}

class AddPlayersPageState extends State<AddPlayersPage> {
  String inputValue = "";
  final fieldText = TextEditingController();
  List<PlayerInfo> gamePlayers = [];
  List<Widget> playerInfo = [];
  final _formKey = GlobalKey<FormBuilderState>();

  void removePlayerInfo(PlayerInfo info) {
    setState(() {
      playerInfo.remove(ItemWidget(info));
    });

    gamePlayers.remove(info);
  }

  void addPlayerInfo(String value) {
    if (value != "") {
      var info = PlayerInfo(0, value);

      // Add to list on screen
      setState(() {
        playerInfo.add(ItemWidget(info));
      });

      // Add to list to create game
      gamePlayers.add(info);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      //resizeToAvoidBottomInset: false,
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(ProjectStrings.addPlayersHeading,
                      style: ProjectTextStyles.pageTitleTextStyle),
                ),
                Container(
                    // TODO: Make them draggable
                    width: 350,
                    height: 400,
                    color: ProjectColors.primarySwatch.shade100,
                    child: Center(
                        child: Column(
                      children: [
                        ListView.builder(
                          // Widget which creates [ItemWidget] in scrollable list.
                          shrinkWrap: true,
                          itemCount: playerInfo
                              .length, // Number of widget to be created.
                          itemBuilder: (context,
                                  itemIndex) => // Builder function for every item with index.
                              playerInfo[itemIndex],
                        ),
                      ],
                    ))),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormBuilder(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: FormBuilderTextField(
                            name: "player",
                            decoration: const InputDecoration(
                              constraints: BoxConstraints(
                                maxWidth: 300,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              filled: true,
                              hintText: ProjectStrings.addPlayerHint,
                              fillColor: Colors.white70,
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle),
                        iconSize: 36,
                        color: ProjectColors.primarySwatch.shade700,
                        onPressed: () {
                          _formKey.currentState?.save();
                          final playerFieldData =
                              _formKey.currentState!.fields["player"]?.value;

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$playerFieldData"),
                            duration: const Duration(seconds: 2),
                          ));

                          // if (playerInfo.length < 8) {
                          //   addPlayerInfo(inputValue);
                          //   inputValue = "";
                          //   fieldText.clear();
                          // } else {
                          //   globals.showAlertDialog(
                          //       context, ProjectStrings.addPlayersMaxErrorMessage);
                          // }
                          _formKey.currentState?.reset();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                    child: const Text(ProjectStrings.nextButton,
                        style: ProjectTextStyles.buttonLargeTextStyle),
                    onPressed: () {
                      if (gamePlayers.isNotEmpty) {
                        //Create new game
                        globals.currentGame = GameInfo(gamePlayers);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomizeGamePage()),
                        );
                      } else {
                        globals.showAlertDialog(
                            context, ProjectStrings.addPlayersErrorMessage);
                      }
                    },
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

class ItemWidget extends StatelessWidget {
  const ItemWidget(this.info, {Key? key}) : super(key: key);

  final PlayerInfo info;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        // Enables taps for child and add ripple effect when child widget is long pressed.
        child: ListTile(
      // Useful standard widget for displaying something in ListView.
      leading: IconButton(
        icon: Icon(info.icon),
        onPressed: () {
          globals.showAlertDialog(context,
              "You and I both wish this removed the player from the list bud. I can't get it to update the state");
        },
      ),
      title: Text(info.displayname.toString()),
    ));
  }
}
