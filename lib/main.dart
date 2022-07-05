import 'package:di_example/bloc_observer.dart';
import 'package:di_example/config/routes/app_routes.dart';
import 'package:di_example/core/res/app_strings.dart';
import 'package:di_example/core/res/styles.dart';
import 'package:di_example/features/bloc_example/presentation/manager/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () {
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
