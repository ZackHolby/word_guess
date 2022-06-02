import 'package:flutter/material.dart';
import 'dart:math';

import 'package:word_guess/guesser/views/guesser_screen.dart';
import 'package:word_guess/guesser/data/word_list.dart';

final List<String> dailyWordList =
    wordLists[Random().nextInt(wordLists.length)];

List<String> _keyboardLetters = getDailyLetters(dailyWordList);
//ADD DELETE AND ENTER

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
    required this.onKeyTapped,
    required this.onDeleteTapped,
    required this.onEnterTapped,
  }) : super(key: key);

  final void Function(String) onKeyTapped;

  final VoidCallback onDeleteTapped;

  final VoidCallback onEnterTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _keyboardLetters.map((letter) {
          return _KeyboardButton(
            onTap: () => onKeyTapped(letter),
            letter: letter,
            backgroundColor: Colors.grey,
          );
        }).toList());
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
          letter: 'ENTERd');

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

List<String> getDailyLetters(List<String> dailyWords) {
  List<String> dailyLetters = [];
  for (String word in dailyWords) {
    List<String> wordSplit = word.split('');
    for (String char in wordSplit) {
      if (!dailyLetters.contains(char)) {
        dailyLetters.add(char);
      }
    }
  }

  return dailyLetters;
}
