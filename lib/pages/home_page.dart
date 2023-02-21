import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var spacing = SizedBox(
    height: 35,
  );
  String result = '';
  String playerOne = 'scissors';
  String playerTwo = 'paper';

  void play() {
    List<String> signs = ['rock', 'paper', 'scissors'];
    int playerOneNum = Random().nextInt(3);
    int playerTwoNum = Random().nextInt(3);
    setState(() {
      playerOne = signs[playerOneNum];
      playerTwo = signs[playerTwoNum];
    });

    if (playerOne == 'rock' && playerTwo == 'scissors') {
      result = 'Player 1 Wins!';
    } else if (playerOne == 'scissors' && playerTwo == 'paper') {
      result = 'Player 1 Wins';
    } else if (playerOne == 'paper' && playerTwo == "rock") {
      result = 'Player 1 Wins!';
    } else if (playerOne == playerTwo) {
      result = 'TIE';
    } else {
      result = 'Player two wins';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rock Paper Scissors"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assests/images/$playerOne.png",
                  width: 150,
                ),
                spacing,
                Text("Player 1"),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  "assests/images/$playerTwo.png",
                  width: 150,
                ),
                spacing,
                Text("Player 2"),
              ],
            ),
          ],
        ),
        spacing,
        ElevatedButton(
          onPressed: () {
            play();
          },
          child: Text("Play"),
        ),
        Text(
          result,
        ),
      ]),
    );
  }
}
