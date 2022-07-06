import 'package:equatable/equatable.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/06/2022 at 13:59.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class NumberTrivia extends Equatable {
  const NumberTrivia({
    required this.text,
    required this.number,
    this.found,
    required this.type,});

  final String text;
  final int number;
  final bool? found;
  final String type;

  @override
  List<Object?> get props => [number, text, found, type];

}