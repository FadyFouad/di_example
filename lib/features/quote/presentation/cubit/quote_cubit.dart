import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:di_example/core/error/failure.dart';
import 'package:di_example/features/num_trivia/domain/usecases/get_random_num_trivia.dart';
import 'package:di_example/features/quote/domain/entities/quote.dart';
import 'package:di_example/features/quote/domain/usecases/get_random_quote.dart';
import 'package:meta/meta.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit({required this.quote}) : super(QuoteInitial());
  final GetRandomQuote quote;

  void getQuote() async {
    Either<Failure, Quote> response = await quote(NoParams());
    emit(QuoteLoading());
    response.fold(
      (failure) => emit(QuoteError(failure.message)),
      (quote) => emit(QuoteLoaded(quote)),
    );
  }
}
