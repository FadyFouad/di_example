import 'package:dartz/dartz.dart';
import 'package:di_example/core/res/app_strings.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/03/2022 at 14:50.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var res = getValue(true);
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
        ),
        body: Center(
          child: _buildBody((res.fold((l) => '$l', (r) => r))),
        ));
  }
}

Either<int,String> getValue(bool bool) {
  if(bool){
    return const Right('Hello');
  }else{
    return const Left(123);
  }
}

Column _buildBody(String quote) {
  return Column(
    children: [
      QuoteCard(quote: quote),
      ReloadButton(onTap: () {
        debugPrint('reload');
      }),
    ],
  );
}
