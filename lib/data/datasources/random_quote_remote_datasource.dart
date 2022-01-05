import 'dart:convert';

import 'package:http/http.dart';
import 'package:pro_quotes/data/core/api_client.dart';
import 'package:pro_quotes/data/core/api_constants.dart';
import 'package:pro_quotes/data/models/random_quote_model.dart';

abstract class RandomQuoteRemoteDatasource {
  Future<RandomQuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDatasourceImpl extends RandomQuoteRemoteDatasource {
  final ApiClient _client;

  RandomQuoteRemoteDatasourceImpl(this._client);

  @override
  Future<RandomQuoteModel> getRandomQuote() async {
    final response = await _client.get(ApiConstants.API_RANDOM);
    final quote = RandomQuoteModel.fromJson(response);
    print(quote);
    return quote;
  }
}
