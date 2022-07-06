import 'package:di_example/core/res/app_strings.dart';
import 'package:flutter/material.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key? key,
  }) : super(key: key);

  @override
  TriviaControlsState createState() => TriviaControlsState();
}

class TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  String? inputStr;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: AppStrings.inputNumberHint,
            ),
            onChanged: (value) {
              inputStr = value;
            },
            validator: (value) {
              if(value!.isEmpty ){
                return AppStrings.numberEmpty;
              }
              return null;
            },
            onFieldSubmitted: (_) {
              dispatchConcrete();
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  // color: Theme.of(context).accentColor,
                  // textTheme: ButtonTextTheme.primary,
                  onPressed: dispatchConcrete,
                  child: const Text(AppStrings.search),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: dispatchRandom,
                  child: const Text(AppStrings.getRandomTrivia),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void dispatchConcrete() {
    // Clearing the TextField to prepare it for the next inputted number
    if(_formKey.currentState!.validate()){
      controller.clear();
      // BlocProvider.of<NumberTriviaBloc>(context)
      //     .add(GetTriviaForConcreteNumber(inputStr));
    }
  }

  void dispatchRandom() {
    controller.clear();
    // BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  }
}
