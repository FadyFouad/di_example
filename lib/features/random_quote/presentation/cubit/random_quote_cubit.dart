import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:di_example/features/random_quote/data/repositories/get_quote_imp.dart';
import 'package:di_example/features/random_quote/domain/repositories/get_quote.dart';
import 'package:meta/meta.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  RandomQuoteCubit() : super(RandomQuoteInitial());
  var error = false;

  void getQuote() {
    emit(RandomQuoteLoading());
    GetQuoteRepository quote = GetQuoteRepositoryImp();
    Timer(const Duration(seconds: 1), () {
      error = DateTime.fromMicrosecondsSinceEpoch(DateTime.now().microsecond).microsecond % 2 == 0;
      emit(quote.getQuote(error).fold((l) =>
          const RandomQuoteError('Error'), (r) => RandomQuoteLoaded(r)));
    });
  }
}
