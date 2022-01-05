import 'package:pro_quotes/data/models/quote_model.dart';

class PopularQuotesModel {
  String? author;
  int? id;
  String? quote;
  String? permalink;

  PopularQuotesModel({this.author, this.id, this.quote, this.permalink});

  factory PopularQuotesModel.fromJson(Map<String, dynamic> json) {
    return PopularQuotesModel(
        author: json['author'],
        id: json['id'],
        quote: json['quote'],
        permalink: json['permalink']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['author'] = author;
    data['id'] = id;
    data['quote'] = quote;
    data['permalink'] = permalink;
    return data;
  }
}
