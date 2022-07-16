import 'package:dartz/dartz.dart';
import 'package:di_example/core/error/failure.dart';
import 'package:di_example/core/network/network_info.dart';
import 'package:di_example/features/quote/data/data_sources/local_quote.dart';
import 'package:di_example/features/quote/data/data_sources/remote_quote.dart';
import 'package:di_example/features/quote/data/models/quote_model.dart';
import 'package:di_example/features/quote/domain/repositories/quote_repositry.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/16/2022 at 12:51.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class QuoteRepositoryImp extends QuoteRepository {
  QuoteRepositoryImp({
    required this.networkInfo,
    required this.remoteQuote,
    required this.localQuote,
  });

  NetworkInfo networkInfo;
  RemoteQuote remoteQuote;
  LocalQuote localQuote;

  @override
  Future<Either<Failure, QuoteModel>> getRandomQuote() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(remoteQuote.getRemoteQuote());
      } else {
        return Right(localQuote.getLocalQuote());
      }
    } catch (e) {
      return const Left(ServerFailure('Server Failure'));
    }
  }
}
