import 'package:di_example/core/res/app_strings.dart';
import 'package:di_example/features/num_trivia/presentation/pages/number_trivia_page.dart';
import 'package:di_example/features/quote/presentation/pages/quote_screen.dart';
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
  static const String numTriviaScreen = '/numTriviaScreen';

}

class AppRoutes{
  static Route? onGeneratedRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.init:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.quotesScreen:
        return MaterialPageRoute(builder: (_) => const QuoteScreen());
      case Routes.numTriviaScreen:
        return MaterialPageRoute(builder: (_) => NumberTriviaPage());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen(title: AppStrings.notFound));
    }
  }
}


// final routes = {
//   Routes.init : (context) => const SplashScreen(),
//   Routes.quotesScreen : (context) => const QuoteScreen(),
// };