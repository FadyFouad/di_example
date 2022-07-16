import 'package:di_example/features/quote/data/models/quote_model.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/16/2022 at 13:26.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class LocalQuote {
  getLocalQuote();
}

class LocalQuoteImp extends LocalQuote {
  @override
  getLocalQuote() {
    return QuoteModel(text: 'text local', author: 'author');
  }
}
