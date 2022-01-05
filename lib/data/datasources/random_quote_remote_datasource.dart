import 'dart:convert';

import 'package:http/http.dart';
import 'package:pro_quotes/data/core/api_constants.dart';
import 'package:pro_quotes/data/models/random_quote_model.dart';

abstract class RandomQuoteRemoteDatasource {
  Future<RandomQuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDatasourceImpl extends RandomQuoteRemoteDatasource {
  final Client _client;

  RandomQuoteRemoteDatasourceImpl(this._client);

  @override
  Future<RandomQuoteModel> getRandomQuote() async {
    final response = await _client.get(Uri.parse(ApiConstants.API_RANDOM),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final quote = RandomQuoteModel.fromJson(responseBody);
      return quote;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
