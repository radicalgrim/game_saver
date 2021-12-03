import 'package:game_saver/pages/add_players_page.dart';
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
  
  void toggleSwitch(bool value) {  
    if(globals.currentGame!.showTimer == false)  
    {  
      setState(() {  
        showTimer = globals.currentGame!.showTimer = true;
      });  
    }  
    else  
    {  
      setState(() {  
        showTimer = globals.currentGame!.showTimer = false;  
      });  
    }
  }  

  //PAGE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primarySwatch.shade50,
      appBar: AppBar(
        title: const Text(ProjectStrings.gameCustomizationHeader),
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
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(ProjectStrings.gameCustTitle,
                      style: ProjectTextStyles.appMiniTitleTextStyle)
                  ),
                  SizedBox(
                  width: 300,
                  height: 50,
                  child: 
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: ProjectStrings.gameCustExample,
                        labelText: ProjectStrings.gameCustReq,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      ),
                      onChanged: (String value) {
                        globals.currentGame!.name = value;
                      },
                      controller: fieldText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(ProjectStrings.gameCustStyle,
                      style: ProjectTextStyles.appMiniTitleTextStyle)
                  ),
                  ListTile(
                    title: const Text(ProjectStrings.gameCustHigh),
                    leading: Radio<globals.HighLowOptions>(
                      value: globals.HighLowOptions.high,
                      groupValue: globals.currentGame!.highlowOption,
                      onChanged: (globals.HighLowOptions? value) {
                        setState(() {
                          globals.currentGame!.highlowOption = value;
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
                          globals.currentGame!.highlowOption = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text('Show Timer  -  $showTimer', style: ProjectTextStyles.appMiniTitleTextStyle),
                  ),
                  Switch(  
                    onChanged: toggleSwitch,  
                    value: globals.currentGame!.showTimer,
                    activeColor: Colors.blue,  
                    activeTrackColor: Colors.yellow,  
                    inactiveThumbColor: Colors.redAccent,  
                    inactiveTrackColor: Colors.orange,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 50, 0, 0),
                    child: ElevatedButton(
                      child: const Text(ProjectStrings.gameCustStartGame,
                          style: ProjectTextStyles.buttonLargeTextStyle),
                      onPressed: () {
                        if (globals.currentGame!.name == null)
                        {
                          globals.showAlertDialog(context, ProjectStrings.gameCustReqError);
                        }
                        else
                        {
                          globals.currentGame!.initPlayers();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RoundXPage()));
                        }
                      },
                    ),
                  ),
                ],),
                width: 350,
                height: 600,
                color: ProjectColors.primarySwatch.shade100,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


