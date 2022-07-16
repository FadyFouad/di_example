import 'package:dartz/dartz.dart';
import 'package:di_example/features/quote/domain/entities/quote.dart';

import '../../../../core/error/failure.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/16/2022 at 11:55.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
