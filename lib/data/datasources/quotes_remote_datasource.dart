import 'dart:convert';

import 'package:http/http.dart';
import 'package:pro_quotes/data/core/api_client.dart';
import 'package:pro_quotes/data/core/api_constants.dart';
import 'package:pro_quotes/data/models/popular_quotes_model.dart';
import 'package:pro_quotes/data/models/random_quote_model.dart';

abstract class QuotesRemoteDatasource {
  Future<RandomQuoteModel> getRandomQuote();
  Future<List<PopularQuotesModel>> getPopularQuotes();
}

class QuotesRemoteDatasourceImpl extends QuotesRemoteDatasource {
  final ApiClient _client;

  QuotesRemoteDatasourceImpl(this._client);

  @override
  Future<RandomQuoteModel> getRandomQuote() async {
    final response = await _client.get(ApiConstants.API_RANDOM);
    final quote = RandomQuoteModel.fromJson(response);
    print(quote);
    return quote;
  }

  @override
  Future<List<PopularQuotesModel>> getPopularQuotes() async {
    final response = await _client.get(ApiConstants.API_POPULAR);
    final quotes = List<PopularQuotesModel>.from(
        json.decode(response.body).map((x) => PopularQuotesModel.fromJson(x)));
    print(quotes.length);
    return quotes;
  }
}
