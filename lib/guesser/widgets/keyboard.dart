import 'package:flutter/material.dart';
import 'dart:math';

import 'package:word_guess/guesser/views/guesser_screen.dart';
import 'package:word_guess/guesser/data/word_list.dart';

final List<String> dailyWordList =
    wordLists[Random().nextInt(wordLists.length)];

List<String> _keyboardLetters = getDailyLetters(dailyWordList);
const _keyboardActions = ['SHUFFLE', 'ENTER', 'DEL'];

class Keyboard extends StatefulWidget {
  List<String> keyboardLetters;

  Keyboard({
    Key? key,
    required this.keyboardLetters,
    required this.onKeyTapped,
    required this.onDeleteTapped,
    required this.onEnterTapped,
    required this.onShuffleTapped,
  }) : super(key: key);

  final void Function(String) onKeyTapped;

  final VoidCallback onDeleteTapped;

  final VoidCallback onEnterTapped;

  final VoidCallback onShuffleTapped;

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.keyboardLetters.map((letter) {
              return _KeyboardButton(
                onTap: () => widget.onKeyTapped(letter),
                letter: letter,
                backgroundColor: Colors.grey,
              );
            }).toList()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _keyboardActions.map((letter) {
            if ((letter) == 'DEL') {
              return _KeyboardButton.delete(onTap: widget.onDeleteTapped);
            } else if ((letter) == 'ENTER') {
              return _KeyboardButton.enter(onTap: widget.onEnterTapped);
            } else if ((letter) == 'SHUFFLE') {
              return _KeyboardButton.shuffle(onTap: widget.onShuffleTapped);
            }
            return _KeyboardButton(
              onTap: () => widget.onKeyTapped(letter),
              letter: letter,
              backgroundColor: Colors.grey,
            );
          }).toList(),
        )
      ],
    );
  }
}

class _KeyboardButton extends StatelessWidget {
  const _KeyboardButton({
    Key? key,
    this.height = 48,
    this.width = 30,
    required this.onTap,
    required this.backgroundColor,
    required this.letter,
  }) : super(key: key);

  factory _KeyboardButton.delete({
    required VoidCallback onTap,
  }) =>
      _KeyboardButton(
          width: 56, onTap: onTap, backgroundColor: Colors.grey, letter: 'DEL');

  factory _KeyboardButton.enter({
    required VoidCallback onTap,
  }) =>
      _KeyboardButton(
          width: 56,
          onTap: onTap,
          backgroundColor: Colors.grey,
          letter: 'ENTER');

  factory _KeyboardButton.shuffle({
    required VoidCallback onTap,
  }) =>
      _KeyboardButton(
          width: 56,
          onTap: onTap,
          backgroundColor: Colors.grey,
          letter: 'SHUFFLE');

  final double height;

  final double width;

  final VoidCallback onTap;

  final Color backgroundColor;

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
        horizontal: 2.0,
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            child: Text(
              letter,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
