import 'package:di_example/bloc_observer.dart';
import 'package:di_example/config/routes/app_routes.dart';
import 'package:di_example/core/res/app_strings.dart';
import 'package:di_example/core/res/styles.dart';
import 'package:di_example/di.dart';
import 'package:di_example/features/bloc_example/presentation/manager/counter_cubit.dart';
import 'package:di_example/features/num_trivia/presentation/cubit/number_trivia_cubit.dart';
import 'package:di_example/features/quote/presentation/cubit/quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
BlocOverrides.runZoned(
    () async{
      await init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<QuoteCubit>(
          create: (context) => QuoteCubit(quote: sl()),
        ),
        BlocProvider<NumberTriviaCubit>(
            create: (context) => NumberTriviaCubit(
                  getTriviaConcreteNumber: sl(),
                  getTriviaRandomNumber: sl(),
                )),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: themeLight,
        onGenerateRoute: AppRoutes.onGeneratedRoute,
        initialRoute: Routes.init,
      ),
    );
  }
}
