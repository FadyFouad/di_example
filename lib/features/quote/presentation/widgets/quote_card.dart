import 'package:di_example/core/res/resources.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/04/2022 at 08:19.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class QuoteCard extends StatelessWidget {
  final String quote;

  const QuoteCard({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      constraints: const BoxConstraints(minHeight: 300, minWidth: 300),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
        ),
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        quote,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
