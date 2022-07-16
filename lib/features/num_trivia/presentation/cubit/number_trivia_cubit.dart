import 'package:bloc/bloc.dart';
import 'package:di_example/di.dart';
import 'package:di_example/features/num_trivia/data/data_sources/number_trivia_remote.dart';
import 'package:di_example/features/num_trivia/domain/entities/number_trivia.dart';
import 'package:di_example/features/num_trivia/domain/usecases/get_concrete_num_trivia.dart';
import 'package:di_example/features/num_trivia/domain/usecases/get_random_num_trivia.dart';
import 'package:meta/meta.dart';

part 'number_trivia_state.dart';

class NumberTriviaCubit extends Cubit<NumberTriviaState> {
  NumberTriviaCubit({
    required this.getTriviaRandomNumber,
    required this.getTriviaConcreteNumber,
  }) : super(NumberTriviaInitial());
  final GetRandomNumberTrivia getTriviaRandomNumber;
  final GetConcreteNumberTrivia getTriviaConcreteNumber;

  Future<void> getConcreteNumberTrivia(int number) async {
    emit(NumberTriviaLoading());
    var t = await getTriviaRandomNumber(NoParams());
    emit(t.fold(
        (l) => NumberTriviaError('Faild'), (r) => NumberTriviaLoaded(r)));
  }

  void getTriviaForRandomNumber() async {
    emit(NumberTriviaLoading());
    var t = await NumberTriviaRemoteImp(
      client: sl(),
    ).getRandomNumberTrivia();
    emit(NumberTriviaLoaded(t));
  }
}
