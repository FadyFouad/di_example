import 'package:di_example/core/res/app_strings.dart';
import 'package:di_example/features/bloc_example/presentation/pages/counter_screen.dart';
import 'package:di_example/features/random_quote/presentation/pages/quote_screen.dart';
import 'package:di_example/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/03/2022 at 14:44.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class Routes {
  static const String init = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';

  static const String quotesScreen = '/quotes_screen';

}

class AppRoutes{
  static Route? onGeneratedRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.init:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.quotesScreen:
        return MaterialPageRoute(builder: (_) => const CounterScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen(title: AppStrings.notFound));
    }
  }
}


// final routes = {
//   Routes.init : (context) => const SplashScreen(),
//   Routes.quotesScreen : (context) => const QuoteScreen(),
// };