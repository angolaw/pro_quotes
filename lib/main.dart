import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pro_quotes/data/core/api_client.dart';
import 'package:pro_quotes/data/datasources/quotes_remote_datasource.dart';
import 'package:pro_quotes/data/models/random_quote_model.dart';

import 'data/models/popular_quotes_model.dart';

void main() async {
  QuotesRemoteDatasource quotesDataSource =
      QuotesRemoteDatasourceImpl(ApiClient(
    Client(),
  ));
  final quote = await quotesDataSource.getRandomQuote();
  final quotes = await quotesDataSource.getPopularQuotes();
  runApp(MyApp(
    quote: quote,
    quotes: quotes,
  ));
}

class MyApp extends StatelessWidget {
  final RandomQuoteModel quote;
  final List<PopularQuotesModel> quotes;
  const MyApp({Key? key, required this.quote, required this.quotes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Column(
              children: [
                Text(quote.quote ?? "No quote"),
                Text(quotes.length.toString()),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
