class Quote {
  int? quoteId;
  String? quote;
  String? author;
  String? series;

  Quote({this.quoteId, this.quote, this.author, this.series});

  Quote.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'];
    quote = json['quote'];
    author = json['author'];
    series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote_id'] = this.quoteId;
    data['quote'] = this.quote;
    data['author'] = this.author;
    data['series'] = this.series;
    return data;
  }
}
