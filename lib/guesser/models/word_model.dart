import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:word_guess/guesser/guesser.dart';
import 'package:word_guess/guesser/models/letter_model.dart';

enum WordStatus { initial, correct }

class Word extends Equatable {
  const Word({
    required this.letters,
  });

  factory Word.fromString(String word) =>
      Word(letters: word.split('').map((e) => Letter(val: e)).toList());

  final List<Letter> letters;

  String get wordString => letters.map((e) => e.val).join();

  void addLetter(String val) {
    final currentIndex = letters.indexWhere((e) => e.val.isEmpty);
    if (currentIndex != -1) {
      letters[currentIndex] = Letter(val: val);
    }
  }

  void removeLetter() {
    final recentLetterIndex = letters.lastIndexWhere((e) => e.val.isNotEmpty);
    if (recentLetterIndex != -1) {
      letters[recentLetterIndex] = Letter.empty();
    }
  }

  List<Letter> getCurrentWord() {
    return letters;
  }

  @override
  List<Object?> get props => [letters];
}
