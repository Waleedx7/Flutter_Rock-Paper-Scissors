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
  String plyerTwo = 'paper';

  void play() {
    List<String> signs = ['rock', 'paper', 'scissors'];
    int playerOneNum = Random().nextInt(3);
    int playerTwoNum = Random().nextInt(3);
    setState(() {
      playerOne = signs[playerOneNum];
      playerTwoNum = signs[playerTwoNum] as int;
    });

    if (playerOne == 'rock' && plyerTwo == 'scissors') {
      result = 'Player 1 Wins!';
    } else if (playerOne == 'scissors' && plyerTwo == 'paper') {
      result = 'Player 1 Wins';
    } else if (playerOne == 'paper' && plyerTwo == "rock") {
      result = 'Player 1 Wins!';
    } else if (playerOne == plyerTwo) {
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
                  "assests/images/$plyerTwo.png",
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
