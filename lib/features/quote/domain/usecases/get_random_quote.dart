import 'package:dartz/dartz.dart';
import 'package:di_example/core/error/failure.dart';
import 'package:di_example/core/usecases/usecase.dart';
import 'package:di_example/features/num_trivia/domain/usecases/get_random_num_trivia.dart';
import 'package:di_example/features/quote/domain/entities/quote.dart';
import 'package:di_example/features/quote/domain/repositories/quote_repositry.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/16/2022 at 11:43.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class GetRandomQuote extends UseCase<Quote, NoParams> {
  QuoteRepository quoteRepository;

  GetRandomQuote({
    required this.quoteRepository,
  });

  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepository.getRandomQuote();
  }
}
