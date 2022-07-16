import 'package:di_example/features/num_trivia/presentation/cubit/number_trivia_cubit.dart';
import 'package:di_example/features/num_trivia/presentation/widgets/trivial_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Number Trivia"),
        ),
        body: buildBody(context));
  }

  buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Top half
            BlocBuilder<NumberTriviaCubit, NumberTriviaState>(
              builder: (context, NumberTriviaState state) {
                if (state is NumberTriviaLoaded) {
                  return MessageDisplay(message: '${state.trivia.text}');
                } else if (state is NumberTriviaLoading) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.red,
                      )));
                } else if (state is NumberTriviaError) {
                  return MessageDisplay(message: 'Error : ${state.message}');
                } else {
                  return MessageDisplay(message: 'Search for num');
                }
              },
            ),

            const SizedBox(height: 20),
            // Bottom half
            const TriviaControls(),
          ],
        ),
      ),
    );
  }
}

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({
    Key? key,
    required this.message,
  })  : assert(message != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Third of the size of the screen
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
