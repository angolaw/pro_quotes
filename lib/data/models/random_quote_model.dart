class RandomQuoteModel {
  String? author;
  int? id;
  String? quote;
  String? permalink;

  RandomQuoteModel({this.author, this.id, this.quote, this.permalink});

  factory RandomQuoteModel.fromJson(Map<String, dynamic> json) {
    return RandomQuoteModel(
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
