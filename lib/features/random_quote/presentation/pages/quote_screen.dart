import 'dart:async';

import 'package:di_example/core/res/app_strings.dart';
import 'package:di_example/features/random_quote/presentation/cubit/random_quote_cubit.dart';
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
    // TODO: implement initState
    super.initState();
    context.read<RandomQuoteCubit>().getQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
        ),
        body: BlocConsumer<RandomQuoteCubit, RandomQuoteState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is RandomQuoteLoading) {
              body = const Center(child: CircularProgressIndicator());
            }  else if (state is RandomQuoteLoaded) {
              body = Center(
                child: _buildBody(state.quote, () {
                  context.read<RandomQuoteCubit>().getQuote();
                  Timer(const Duration(seconds: 2), () {
                    context.read<RandomQuoteCubit>().getQuote();
                  });
                }
                ),
              );
            }else{
              body = Center(
                child: _buildBody("Error", () {
                  context.read<RandomQuoteCubit>().getQuote();
                  Timer(const Duration(seconds: 2), () {
                    context.read<RandomQuoteCubit>().getQuote();
                  });
                }
                ),
              );
            }
            return body;
          },
        ));
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

