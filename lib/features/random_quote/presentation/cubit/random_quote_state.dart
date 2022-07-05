part of 'random_quote_cubit.dart';

@immutable
abstract class RandomQuoteState {  const RandomQuoteState();
}

class RandomQuoteInitial extends RandomQuoteState {
}

class RandomQuoteLoading extends RandomQuoteState {}
class RandomQuoteLoaded extends RandomQuoteState {
  final String quote;
  RandomQuoteLoaded(this.quote);
}
class RandomQuoteError extends RandomQuoteState {
  final String errorMsg;
  RandomQuoteError(this.errorMsg);
}
