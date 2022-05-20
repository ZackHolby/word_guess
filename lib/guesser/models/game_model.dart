import 'dart:html';

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:word_guess/guesser/guesser.dart';
import 'package:word_guess/guesser/models/letter_model.dart';
import 'package:word_guess/guesser/models/word_model.dart';

enum GameStatus { playing, submitting, finished }

class GuessScreen extends StatefulWidget {
  const GuessScreen({Key? key}) : super(key: key);

  @override
  _GuessScreenState createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  GameStatus _gameStatus = GameStatus.playing;

  final List<Word> _board = List.generate(
    1,
    (_) => Word(letters: List.generate(6, (_) => Letter.empty())),
  );

  Word? get _currentWord => _board[0];

  @override
  Widget build(BuildContext context) {
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
        children: [Board(board: _board)],
      ),
    );
  }
}
