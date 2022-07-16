import 'package:di_example/features/quote/data/models/quote_model.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/16/2022 at 13:24.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class RemoteQuote {
  getRemoteQuote();
}

class RemoteQuoteImp extends RemoteQuote {
  @override
  getRemoteQuote() {
    return QuoteModel(text: 'text remote', author: 'author');
  }
}
