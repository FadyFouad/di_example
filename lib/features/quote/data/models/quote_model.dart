import 'package:di_example/features/quote/domain/entities/quote.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/16/2022 at 12:02.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class QuoteModel extends Quote {
  const QuoteModel({required String text, required String author})
      : super(text: text, author: author);

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
    };
  }

  factory QuoteModel.fromJson(Map<String, dynamic> map) {
    return QuoteModel(
      text: map['text'] ?? '',
      author: map['author'] ?? '',
    );
  }
}
