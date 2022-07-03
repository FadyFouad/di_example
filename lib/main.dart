import 'package:di_example/config/routes/app_routes.dart';
import 'package:di_example/core/res/styles.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TDD',
      theme: themeLight,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      initialRoute: Routes.init,
    );
  }
}
