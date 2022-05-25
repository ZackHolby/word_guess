import 'package:flutter/material.dart';
import 'package:word_guess/guesser/models/word_model.dart';
import 'package:word_guess/guesser/widgets/board_tile.dart';

class Board extends StatelessWidget {
  const Board({
    Key? key,
    required this.board,
  }) : super(key: key);

  final List<Word> board;

  @override
  Widget build(BuildContext context){
    return Column(
      children: board
      .map(
        (word) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: word.letters.map((letter) => BoardTile(letter: letter))
          .toList(),
      ),
      ).toList(),
      );
  }
}