import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:game_saver/pages/end_of_round.dart';
import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';
import 'package:page_transition/page_transition.dart';

class RoundXPage extends StatefulWidget {
  const RoundXPage({Key? key}) : super(key: key);
  static const String route = "/rounds";
  @override
  RoundXPageState createState() => RoundXPageState();
}

class RoundXPageState extends State<RoundXPage> {
  final fieldText = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  final int roundNum = globals.currentGame!.round + 1;
  final int playerIndex = globals.currentGame!.currentPlayer;

  int score = 0;

  //PAGE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      resizeToAvoidBottomInset: false,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text("Round $roundNum",
                      style: ProjectTextStyles.pageTitleTextStyle),
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: ProjectColors.primarySwatch.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: globals.currentGame!.playersView[playerIndex],
                ),
                FormBuilder(
                  key: _formKey,
                  onChanged: () {
                    _formKey.currentState?.save();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: FormBuilderTextField(
                      name: "score",
                      keyboardType: TextInputType.number,
                      style: ProjectTextStyles.playerScoreInputTextStyle,
                      textAlign: TextAlign.center,
                      showCursor: false,
                      decoration: InputDecoration(
                        constraints: const BoxConstraints(
                          maxWidth: 225,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        filled: true,
                        hintText: ProjectStrings.scoreInputHint,
                        labelText: ProjectStrings.scoreInputLabel,
                        labelStyle:
                            ProjectTextStyles.playerScoreInputLabelTextStyle,
                        fillColor: Colors.white70,
                      ),
                    ),
                  ),
                ),
                // IconButton(
                //   icon: const Icon(Icons.add_circle),
                //   color: ProjectColors.primarySwatch.shade700,
                //   onPressed: () {
                //     final pointsToAdd = int.parse(
                //         _formKey.currentState!.fields["score"]?.value);
                //     if (pointsToAdd != 0) {
                //       globals.currentGame!.players[playerIndex].pointsToAdd =
                //           pointsToAdd;
                //       globals.currentGame!.players[playerIndex].score +=
                //           pointsToAdd;
                //       nextPlayer();
                //     }
                //   },
                // ),
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.fromLTRB(130, 10, 0, 0),
                //       child: SizedBox(
                //         width: 100,
                //         height: 50,
                //         child: TextField(
                //           keyboardType: TextInputType.number,
                //           decoration: const InputDecoration(
                //             hintText: ProjectStrings.roundInputExample,
                //             labelText: ProjectStrings.roundInput,
                //             contentPadding: EdgeInsets.symmetric(
                //                 horizontal: 20.0, vertical: 10.0),
                //           ),
                //           onChanged: (String value) {
                //             score = int.parse(value);
                //           },
                //           controller: fieldText,
                //         ),
                //       ),
                //     ),
                //     Padding(
                //         padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                //         child: IconButton(
                //           icon: const Icon(Icons.add_circle),
                //           color: ProjectColors.primarySwatch.shade700,
                //           onPressed: () {
                //             if (score != 0) {
                //               globals.currentGame!.players[playerIndex].points +=
                //                   score;
                //               score = 0;
                //               fieldText.clear();
                //               nextPlayer();
                //             }
                //           },
                //         )),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        child: const Text(ProjectStrings.roundPrevious,
                            style: ProjectTextStyles.buttonLargeTextStyle),
                        onPressed: () {
                          previousPlayer();
                        },
                      ),
                      ElevatedButton(
                        child: const Text(ProjectStrings.roundNext,
                            style: ProjectTextStyles.buttonLargeTextStyle),
                        onPressed: () {
                          final pointsToAdd = int.parse(
                              _formKey.currentState!.fields["score"]?.value);
                          if (pointsToAdd != 0) {
                            globals.currentGame!.players[playerIndex]
                                .pointsToAdd = pointsToAdd;
                            globals.currentGame!.players[playerIndex].score +=
                                pointsToAdd;
                            nextPlayer();
                          }
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: ElevatedButton(
                    child: const Text(ProjectStrings.roundEnd,
                        style: ProjectTextStyles.buttonLargeTextStyle),
                    onPressed: () {
                      globals.currentGame!.setTime();
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const EndOfRound()));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void previousPlayer() {
    globals.currentGame!.currentPlayer = globals.currentGame!.currentPlayer - 1;
    if (globals.currentGame!.currentPlayer < 0) {
      globals.currentGame!.currentPlayer =
          globals.currentGame!.totalPlayers() - 1;
    }
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade, child: const RoundXPage()));
  }

  void nextPlayer() {
    globals.currentGame!.currentPlayer = globals.currentGame!.currentPlayer + 1;

    if (globals.gameOptionEndRoundOnPlayer &&
        globals.currentGame!.currentPlayer ==
            globals.currentGame!.totalPlayers()) {
      globals.currentGame!.setTime();
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade, child: const EndOfRound()));
    } else {
      globals.currentGame!.currentPlayer %= globals.currentGame!.totalPlayers();
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade, child: const RoundXPage()));
    }
  }
}
