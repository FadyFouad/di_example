import 'dart:convert';

import 'package:di_example/features/num_trivia/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/09/2022 at 15:19.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteImp extends NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteImp({required this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    final response = await client.get(
        Uri.parse('http://numbersapi.com/$number'),
        headers: {'Content-Type': 'application/json'});
    return NumberTriviaModel.fromJson(json.decode(response.body));
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    final response = await client.get(Uri.parse('http://numbersapi.com/random'),
        headers: {'Content-Type': 'application/json'});
    return NumberTriviaModel.fromJson(json.decode(response.body));
  }
}
