/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/10/2022 at 10:09.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


import 'package:di_example/features/num_trivia/domain/entities/number_trivia.dart';

/// text : "2012 is the year that the century's second and last solar transit of Venus occurs on June 6."
/// found : true
/// number : 2012
/// type : "year"
/// date : "June 6"

class NumberTriviaModel extends NumberTrivia{
  NumberTriviaModel({
      this.text,
      this.found, 
      this.number,
      this.type,
      }):super(text: text!, found: found, number: number!, type: type!,);

  NumberTriviaModel.fromJson(dynamic json) {
    text = json['text']??'';
    found = json['found']??'';
    number = json['number']??'';
    type = json['type']??'';
    // date = json['date'];
  }
  String? text;
  bool? found;
  int? number;
  String? type;
  // String? date;
NumberTriviaModel copyWith({  String? text,
  bool? found,
  int? number,
  String? type,
  String? date,
}) => NumberTriviaModel(  text: text ?? this.text,
  found: found ?? this.found,
  number: number ?? this.number,
  type: type ?? this.type,
  // date: date ?? this.date,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['found'] = found;
    map['number'] = number;
    map['type'] = type;
    // map['date'] = date;
    return map;
  }

}