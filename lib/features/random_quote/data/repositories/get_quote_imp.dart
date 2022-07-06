import 'package:dartz/dartz.dart';
import 'package:di_example/features/random_quote/domain/repositories/get_quote.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/06/2022 at 09:44.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class GetQuoteRepositoryImp implements GetQuoteRepository {

  @override
  Either<int, String> getQuote(bool bool) {
    if (bool) {
      return const Left(123);
    } else {
      return const Right('Hello World');
    }
  }

  GetQuoteRepositoryImp():super();
}