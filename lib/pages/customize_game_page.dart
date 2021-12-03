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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Text(ProjectStrings.gameOptionsTitle,
                    style: ProjectTextStyles.pageTitleTextStyle),
              ),
              Container(
                child: Column(children: [
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
