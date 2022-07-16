import 'dart:convert';

import 'package:di_example/core/error/exceptions.dart';
import 'package:di_example/features/num_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/10/2022 at 10:02.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class NumberTriviaDatabaseProvider {
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> insertNumberTrivia(NumberTriviaModel trivia);
}

class NumberTriviaDatabaseProviderImpl implements NumberTriviaDatabaseProvider {
  final SharedPreferences numberTriviaDao;
  NumberTriviaDatabaseProviderImpl({required this.numberTriviaDao});
  @override
  Future<NumberTriviaModel> getLastNumberTrivia() async{
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    var jsonString = numberTriviaDao.getString('numberTrivia');
    if (jsonString != null) {
      return NumberTriviaModel.fromJson(jsonDecode(jsonString));
    }else{
      throw const CacheException();
    }
  }
  @override
  Future<void> insertNumberTrivia(NumberTriviaModel trivia) async{
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    numberTriviaDao.setString('numberTrivia', jsonEncode(trivia.toJson()));
  }
}