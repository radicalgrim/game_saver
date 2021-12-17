import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:game_saver/pages/round_x_page.dart';
import 'package:game_saver/res/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_saver/res/colors.dart';
import 'package:game_saver/res/strings.dart';
import 'package:game_saver/res/text_styles.dart';

class CustomizeGamePage extends StatefulWidget {
  const CustomizeGamePage({Key? key}) : super(key: key);
  static const String route = "/gamecustomization";
  @override
  CustomizeGamePageState createState() => CustomizeGamePageState();
}

class CustomizeGamePageState extends State<CustomizeGamePage> {
  final fieldText = TextEditingController();
  bool showTimer = globals.currentGame!.showTimer;
  String showTimerString = (globals.currentGame!.showTimer ? "On" : "Off");
  final _formKey = GlobalKey<FormBuilderState>();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(ProjectStrings.gameCustomizationHeader,
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              Container(
                width: 350,
                height: 425,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                decoration: BoxDecoration(
                    color: ProjectColors.primarySwatch.shade100,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(ProjectStrings.gameCustTitle,
                                style:
                                    ProjectTextStyles.appMiniTitleTextStyle)),
                        FormBuilder(
                          key: _formKey,
                          onChanged: () {
                            _formKey.currentState?.save();
                            final titleFieldData =
                                _formKey.currentState!.fields["title"]?.value;
                            globals.currentGame!.name = titleFieldData;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: FormBuilderTextField(
                              name: "title",
                              textCapitalization: TextCapitalization.sentences,
                              decoration: const InputDecoration(
                                constraints: BoxConstraints(
                                  maxWidth: 330,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                filled: true,
                                hintText: ProjectStrings.gameCustHint,
                                fillColor: Colors.white70,
                                isDense: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(ProjectStrings.gameCustStyle,
                                style:
                                    ProjectTextStyles.appMiniTitleTextStyle)),
                        ListTile(
                          title: const Text(ProjectStrings.gameCustHigh),
                          leading: Radio<globals.HighLowOptions>(
                            value: globals.HighLowOptions.high,
                            groupValue: globals.currentGame!.highlowOption,
                            onChanged: (globals.HighLowOptions? value) {
                              setState(() {
                                globals.currentGame!.highlowOption = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text(ProjectStrings.gameCustLow),
                          leading: Radio<globals.HighLowOptions>(
                            value: globals.HighLowOptions.low,
                            groupValue: globals.currentGame!.highlowOption,
                            onChanged: (globals.HighLowOptions? value) {
                              setState(() {
                                globals.currentGame!.highlowOption = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Text("Timer - $showTimerString",
                              style: ProjectTextStyles.appMiniTitleTextStyle),
                        ),
                        Switch(
                          onChanged: toggleSwitch,
                          value: globals.currentGame!.showTimer,
                          activeColor: ProjectColors.primarySwatch.shade500,
                          activeTrackColor:
                              ProjectColors.primarySwatch.shade200,
                          inactiveThumbColor:
                              ProjectColors.primarySwatch.shade200,
                          inactiveTrackColor:
                              ProjectColors.primarySwatch.shade50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(
                  child: const Text(ProjectStrings.gameCustStartGame,
                      style: ProjectTextStyles.buttonStandardTextStyle),
                  onPressed: () {
                    if (globals.currentGame!.name == null ||
                        globals.currentGame!.name == "") {
                      globals.showAlertDialog(
                          context, ProjectStrings.gameCustReqError);
                    } else {
                      globals.currentGame!.initPlayers();
                      globals.currentGame!.startWatch();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RoundXPage()));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toggleSwitch(bool value) {
    if (globals.currentGame!.showTimer == false) {
      setState(() {
        showTimer = globals.currentGame!.showTimer = true;
        showTimerString = "On";
      });
    } else {
      setState(() {
        showTimer = globals.currentGame!.showTimer = false;
        showTimerString = "Off";
      });
    }
  }
}
