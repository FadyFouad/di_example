import 'package:dartz/dartz.dart';
import 'package:di_example/core/error/exceptions.dart';
import 'package:di_example/core/error/failure.dart';
import 'package:di_example/core/network/network_info.dart';
import 'package:di_example/features/num_trivia/data/data_sources/number_trivia_local.dart';
import 'package:di_example/features/num_trivia/data/data_sources/number_trivia_remote.dart';
import 'package:di_example/features/num_trivia/data/models/number_trivia_model.dart';
import 'package:di_example/features/num_trivia/domain/entities/number_trivia.dart';
import 'package:di_example/features/num_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/09/2022 at 14:00.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class NumberTriviaRepositoryImp extends NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImp(
      {required this.remoteDataSource, required this.localDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, NumberTriviaModel>> getConcreteNumberTrivia(int number) async{
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
        await remoteDataSource.getConcreteNumberTrivia(number);
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return const Left(ServerFailure(''));
      }
    } else {
      final localTrivia = await localDataSource.getLastNumberTrivia();
      return Right(localTrivia);
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async{
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
        await remoteDataSource.getRandomNumberTrivia();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return const Left(ServerFailure(''));
      }
    } else {
      final localTrivia = await localDataSource.getLastNumberTrivia();
      return Right(localTrivia);
    }
  }
}