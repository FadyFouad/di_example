import 'package:dartz/dartz.dart';
import 'package:di_example/core/error/failure.dart';
import 'package:di_example/core/usecases/usecase.dart';
import 'package:di_example/features/num_trivia/domain/entities/number_trivia.dart';
import 'package:di_example/features/num_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/06/2022 at 21:02.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class GetRandomNumberTrivia extends UseCase<NumberTrivia,NoParams> {
  final NumberTriviaRepository _numberTriviaRepository;

  GetRandomNumberTrivia(this._numberTriviaRepository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams noParams) async {
    return await _numberTriviaRepository.getRandomNumberTrivia();
  }
}

class NoParams{}