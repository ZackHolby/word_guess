import 'package:flutter/material.dart';
import 'package:word_guess/guesser/models/word_model.dart';
import 'package:word_guess/guesser/widgets/board_tile.dart';
import 'package:word_guess/guesser/widgets/keyboard.dart';

class Answerboard extends StatefulWidget {
  final List<String> dailyWordList;

  const Answerboard({
    Key? key,
    required this.dailyWordList,
  }) : super(key: key);

  @override
  _AnswerboardState createState() => _AnswerboardState();
}

class _AnswerboardState extends State<Answerboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: dailyWordList
          .map(
            (word) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )
          .toList(),
    );
  }
}
