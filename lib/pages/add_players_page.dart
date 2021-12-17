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
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: ProjectColors.primarySwatch.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    width: 350,
                    height: 400,
                    child: Center(
                        child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: playerInfo.length,
                          itemBuilder: (context, itemIndex) =>
                              playerInfo[itemIndex],
                        ),
                      ],
                    ))),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FormBuilder(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: FormBuilderTextField(
                            onEditingComplete: () {
                              submitPlayer();
                            },
                            name: "player",
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              constraints: BoxConstraints(
                                maxWidth: 275,
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
                        iconSize: 40,
                        color: ProjectColors.primarySwatch.shade700,
                        onPressed: () {
                          submitPlayer();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                    child: const Text(ProjectStrings.nextButton,
                        style: ProjectTextStyles.buttonStandardTextStyle),
                    onPressed: () {
                      if (gamePlayers.isNotEmpty) {
                        // Create new game
                        globals.currentGame = GameInfo(players: gamePlayers);

                        //Set defaults from options page for next game
                        // globals.currentGame!.showTimer = globals.gameOptionDefaultTimerON;
                        // globals.currentGame!.highlowOption = globals.gameOptionDefaultScoreLOW;

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

  void submitPlayer() {
    FocusScope.of(context).unfocus();
    final playerFieldData = _formKey.currentState!.fields["player"]?.value;
    if (playerFieldData == null) return;
    if (playerInfo.length < 8) {
      addPlayerInfo(playerFieldData);
    } else {
      globals.showAlertDialog(
          context, ProjectStrings.addPlayersMaxErrorMessage);
    }
    _formKey.currentState?.reset();
  }

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
}

class ItemWidget extends StatelessWidget {
  const ItemWidget(this.info, {Key? key}) : super(key: key);

  final PlayerInfo info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
      child: Text(info.displayname.toString(),
          style: ProjectTextStyles.playerScoreTextStyle),
    );
  }
}
