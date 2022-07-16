import 'package:dartz/dartz.dart';
import 'package:di_example/core/error/failure.dart';
import 'package:di_example/core/usecases/usecase.dart';
import 'package:di_example/features/num_trivia/domain/entities/number_trivia.dart';
import 'package:di_example/features/num_trivia/domain/repositories/number_trivia_repository.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/06/2022 at 21:02.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class GetConcreteNumberTrivia extends UseCase<NumberTrivia,int> {
final NumberTriviaRepository _numberTriviaRepository;
GetConcreteNumberTrivia(this._numberTriviaRepository);

  @override
  Future<Either<Failure, NumberTrivia>> call(int number)async{
    return await _numberTriviaRepository.getConcreteNumberTrivia(number);
  }
}
class NumberParams{
  final int number;
  NumberParams(this.number);
}