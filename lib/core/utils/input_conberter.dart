import 'package:dartz/dartz.dart';
import 'package:di_example/core/error/failure.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/10/2022 at 18:19.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class InputConverter {

  Either<Failure,int> stringToUnsignedInteger(String str) {
    try {
      final int integer = int.parse(str);
      if (integer < 0) throw const FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }

  String? textToNumber(String? text) {
    if (text == null || text.isEmpty) {
      return null;
    }
    final newText = text.replaceAll(RegExp(r'[^\d]'), '');
    if (newText == null || newText.isEmpty) {
      return null;
    }
    return newText;
  }
}

class InvalidInputFailure extends Failure {
  @override
  String get message => 'error';

  @override
  List<Object?> get props => [message];
}