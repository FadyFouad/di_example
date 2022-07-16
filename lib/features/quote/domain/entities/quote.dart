import 'package:equatable/equatable.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/16/2022 at 11:34.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class Quote extends Equatable {
  // final String id;
  final String text;
  final String author;

  const Quote({/*required this.id,*/ required this.text, required this.author});

  @override
  List<Object?> get props => [text, author];
}
