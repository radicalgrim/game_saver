// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
// TODO: Delete this before submitting PR

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String route = "/home";

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("GameSaver"),
          ElevatedButton(
            child: const Text("New Game"),
            onPressed: () {
              // TODO: Implement me
              log("New Game pressed");
            },
          ),
          ElevatedButton(
            child: const Text("Scoreboards"),
            onPressed: () {
              // TODO: Implement me
              log("Scoreboards pressed");
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement me
              log("Game Options icon pressed");
            },
          ),
        ],
      ),
    );
  }
}
