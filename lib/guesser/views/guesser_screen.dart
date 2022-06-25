import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_guess/guesser/data/word_list.dart';
import 'package:word_guess/guesser/models/letter_model.dart';
import 'package:word_guess/guesser/models/word_model.dart';
import 'package:word_guess/guesser/widgets/answer_board.dart';
import 'package:word_guess/guesser/widgets/board.dart';
import 'package:word_guess/guesser/widgets/keyboard.dart';

enum GameStatus { playing, submitting, done }

class GuessScreen extends StatefulWidget {
  const GuessScreen({Key? key}) : super(key: key);

  @override
  _GuessScreenState createState() => _GuessScreenState();
}

final List<String> _dailyWordList =
    wordLists[Random().nextInt(wordLists.length)];

List<String> _keyboardLetters = getDailyLetters(dailyWordList);

class _GuessScreenState extends State<GuessScreen> {
  GameStatus _gameStatus = GameStatus.playing;

  final List<Word> _board = List.generate(
    1,
    (_) => Word(letters: List.generate(6, (_) => Letter.empty())),
  );

  final int _wordsCorrect = 0;
  final int _currentScore = 0;

  Word get _currentWord => _board[0];

  List<String> _solution = _dailyWordList;

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
        children: [
          Answerboard(dailyWordList: _dailyWordList),
          Board(board: _board),
          const SizedBox(height: 10),
          Keyboard(
              keyboardLetters: _keyboardLetters,
              onKeyTapped: _onKeyTapped,
              onDeleteTapped: _onDeleteTapped,
              onEnterTapped: _onEnterTapped,
              onShuffleTapped: _onShuffleTapped)
        ],
      ),
    );
  }

  void _onKeyTapped(String val) {
    if (_gameStatus == GameStatus.playing) {
      setState(() => _currentWord.addLetter(val));
    }
  }

  void _onDeleteTapped() {
    if (_gameStatus == GameStatus.playing) {
      setState(() => _currentWord.removeLetter());
    }
  }

  void _onEnterTapped() {
    if (_gameStatus == GameStatus.playing && _currentWord != null) {
      _gameStatus = GameStatus.submitting;

      String submittedWord =
          _currentWord.getCurrentWord().map((e) => e.val).join();
      print(submittedWord);
      _gameStatus = GameStatus.playing;
    }
  }

  void _onShuffleTapped() {
    if (_gameStatus == GameStatus.playing) {
      setState(() => _keyboardLetters.shuffle());
    }
  }
}

List<String> getDailyLetters(List<String> dailyWords) {
  List<String> dailyLetters = [];
  for (String word in dailyWords) {
    List<String> wordSplit = word.split('');
    for (String char in wordSplit) {
      if (!dailyLetters.contains(char.toUpperCase())) {
        dailyLetters.add(char.toUpperCase());
      }
    }
  }

  return dailyLetters;
}
