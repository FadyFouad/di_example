part of 'random_quote_cubit.dart';

@immutable
abstract class RandomQuoteState {  const RandomQuoteState();
}

class RandomQuoteInitial extends RandomQuoteState {
}

class RandomQuoteLoading extends RandomQuoteState {}
class RandomQuoteLoaded extends RandomQuoteState {
  final String quote;
  const RandomQuoteLoaded(this.quote);
}
class RandomQuoteError extends RandomQuoteState {
  final String errorMsg;
  const RandomQuoteError(this.errorMsg);
}
