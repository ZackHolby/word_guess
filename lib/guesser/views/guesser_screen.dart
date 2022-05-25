import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_guess/guesser/data/word_list.dart';
import 'package:word_guess/guesser/models/letter_model.dart';
import 'package:word_guess/guesser/models/word_model.dart';
import 'package:word_guess/guesser/widgets/board.dart';

enum GameStatus { playing, submitting, done }

class GuessScreen extends StatefulWidget {
  const GuessScreen({ Key? key }) : super(key: key);

  @override
  _GuessScreenState createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  final GameStatus _gameStatus = GameStatus.playing;

  final List<Word> _board = List.generate(1,
  (_) => Word(letters: List.generate(6, (_) => Letter.empty())),);

  final int _wordsCorrect = 0;
  final int _currentScore = 0;

  Word get _currentWord => _board[0];

  List<Word> _solution = wordLists[Random().nextInt(wordLists.length)].cast<Word>();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Word Guess',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Board(board: _board),
          ],
        ),
      );
  }
}