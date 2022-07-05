import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  RandomQuoteCubit() : super(RandomQuoteInitial());

  void getQuote(bool bool) {
    emit(RandomQuoteLoading());
    var res = getValue(bool);
    emit(res.fold(
        (l) => RandomQuoteError('Error'), (r) => RandomQuoteLoaded('quote')));
  }

  Either<int, String> getValue(bool bool) {
    if (bool) {
      return const Right('Hello');
    } else {
      return const Left(123);
    }
  }
}
