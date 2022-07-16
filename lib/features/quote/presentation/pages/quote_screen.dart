import 'dart:async';

import 'package:di_example/core/res/app_strings.dart';
import 'package:di_example/features/quote/presentation/cubit/quote_cubit.dart';

// import 'package:di_example/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/03/2022 at 14:50.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  Widget body = const SizedBox();

  @override
  void initState() {
    super.initState();
    context.read<QuoteCubit>().getQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
        ),
        body: /*Center(
              child: _buildBody('state.quote', () {
                // context.read<RandomQuoteCubit>().getQuote();
                // Timer(const Duration(seconds: 2), () {
                //   context.read<RandomQuoteCubit>().getQuote();
                // });
              }
              ),*/

            BlocConsumer<QuoteCubit, QuoteState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is QuoteLoading) {
              body = const Center(child: CircularProgressIndicator());
            } else if (state is QuoteLoaded) {
              body = Center(
                child: _buildBody(state.quote.text, () {
                  context.read<QuoteCubit>().getQuote();
                  Timer(const Duration(seconds: 2), () {
                    context.read<QuoteCubit>().getQuote();
                  });
                }),
              );
            } else {
              body = Center(
                child: _buildBody("Error", () {
                  context.read<QuoteCubit>().getQuote();
                  Timer(const Duration(seconds: 2), () {
                    context.read<QuoteCubit>().getQuote();
                  });
                }),
              );
            }
            return body;
          },
        ));
    // ));
  }

  Column _buildBody(String quote, onTap) {
    return Column(
      children: [
        QuoteCard(quote: quote),
        ReloadButton(onTap: onTap),
      ],
    );
  }
}
