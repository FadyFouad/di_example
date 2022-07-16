part of 'number_trivia_cubit.dart';

@immutable
abstract class NumberTriviaState {}

class NumberTriviaInitial extends NumberTriviaState {}

class NumberTriviaLoading extends NumberTriviaState {}

class NumberTriviaLoaded extends NumberTriviaState {
  final NumberTrivia trivia;

  NumberTriviaLoaded(this.trivia);
}

class NumberTriviaError extends NumberTriviaState {
  final String message;

  NumberTriviaError(this.message);
}
