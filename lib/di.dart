import 'package:di_example/core/network/network_info.dart';
import 'package:di_example/features/num_trivia/data/data_sources/database_provider.dart';
import 'package:di_example/features/num_trivia/data/data_sources/number_trivia_local.dart';
import 'package:di_example/features/num_trivia/data/data_sources/number_trivia_remote.dart';
import 'package:di_example/features/num_trivia/data/repositories/number_trivia_repository_imp.dart';
import 'package:di_example/features/num_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:di_example/features/num_trivia/domain/usecases/get_concrete_num_trivia.dart';
import 'package:di_example/features/num_trivia/domain/usecases/get_random_num_trivia.dart';
import 'package:di_example/features/num_trivia/presentation/cubit/number_trivia_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/09/2022 at 07:38.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

var sl = GetIt.instance;

final serviceLocator = GetIt.instance;
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  //! Features - Number Trivia
  //Bloc
  serviceLocator.registerFactory(
        () => NumberTriviaCubit(
          getTriviaConcreteNumber: serviceLocator(),
      getTriviaRandomNumber: serviceLocator(),
      // concrete: serviceLocator(),
      // random: serviceLocator(),
      // inputConverter: serviceLocator(),
    ),
  );

  //useCases
  serviceLocator
      .registerLazySingleton<GetConcreteNumberTrivia>(() => GetConcreteNumberTrivia(serviceLocator()));

  serviceLocator
      .registerLazySingleton<GetRandomNumberTrivia>(() => GetRandomNumberTrivia(serviceLocator()));

  //repositories
  serviceLocator.registerLazySingleton<NumberTriviaRepository>(() =>
      NumberTriviaRepositoryImp(
          remoteDataSource: serviceLocator(),
          localDataSource: serviceLocator(),
          networkInfo: serviceLocator()));

  // //DataSources
  serviceLocator.registerLazySingleton<NumberTriviaRemoteDataSource>(
          () => NumberTriviaRemoteImp(client: serviceLocator()));
  serviceLocator.registerLazySingleton<NumberTriviaLocalDataSource>(() =>
      NumberTriviaLocalDataSourceImp(sharedPreferences: serviceLocator()));

  //! Core
  // serviceLocator.registerLazySingleton(() => InputConverter());

  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator
      .registerLazySingleton(() => InternetConnectionChecker());
  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(serviceLocator()));

  serviceLocator.registerLazySingleton(() => sharedPreferences);
  //! External
}
