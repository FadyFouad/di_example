import 'dart:convert';

import 'package:di_example/core/error/exceptions.dart';
import 'package:di_example/features/num_trivia/data/data_sources/database_provider.dart';
import 'package:di_example/features/num_trivia/data/models/number_trivia_model.dart';
import 'package:di_example/features/num_trivia/domain/entities/number_trivia.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/10/2022 at 08:17.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheExceptions] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel trivialToCache);
}

class NumberTriviaLocalDataSourceImp implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() async {
    final jsonString =
    sharedPreferences.getString('numberTrivia');
    if (jsonString != null) {
      NumberTriviaModel numberTrivialModel =
      NumberTriviaModel.fromJson(json.decode(jsonString));
      return numberTrivialModel;
    } else {
      throw const CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel trivialToCache) {
    return sharedPreferences.setString('numberTrivia',
        json.encode(trivialToCache.toJson()));
  }
}
