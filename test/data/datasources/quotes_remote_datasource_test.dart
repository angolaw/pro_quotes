// 1 - Criar mock do HttpClient
// 2 - Criar impl do remoteDataSource
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pro_quotes/data/core/api_constants.dart';
import 'package:pro_quotes/data/models/popular_quotes_model.dart';
import 'package:pro_quotes/data/models/random_quote_model.dart';

import '../../fixture/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

abstract class QuotesRemoteDatasource {
  Future<RandomQuoteModel?> getRandomQuote();
  Future<List<PopularQuotesModel>?> getPopularQuotes();
}

class QuotesRemoteDatasourceImpl implements QuotesRemoteDatasource {
  http.Client client;

  QuotesRemoteDatasourceImpl({required this.client});

  @override
  Future<List<PopularQuotesModel>?> getPopularQuotes() async {
    // TODO: implement getPopularQuotes
    return null;
  }

  @override
  Future<RandomQuoteModel?> getRandomQuote() async {
    client.get(Uri.parse(ApiConstants.API_RANDOM),
        headers: {"Content-Type": "application/json"});
  }
}

void main() {
  late QuotesRemoteDatasourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = QuotesRemoteDatasourceImpl(client: mockHttpClient);
  });

  group("getRandomQuote", () {
    test("should return a random quote when called", () async {
      //arrange
      // ! get uri with any null problem
      when(mockHttpClient.get(any, headers: anyNamed("headers")))
          .thenAnswer((_) async => http.Response(fixture("quote.json"), 200));

      //act
      dataSource.getRandomQuote();

      //assert
      verify(mockHttpClient.get(
          Uri.parse("http://quotes.stormconsultancy.co.uk/quotes/1"),
          headers: anyNamed("headers")));
    });
  });
}
