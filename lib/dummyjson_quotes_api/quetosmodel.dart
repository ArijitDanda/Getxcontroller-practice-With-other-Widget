class Welcome {
    Welcome({
        required this.quotes,
    });

    List<Quote> quotes;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "quotes": List<dynamic>.from(quotes.map((x) => x.toJson())),
    };
}

class Quote {
    Quote({
        required this.id,
        required this.quote,
        required this.author,
    });

    int id;
    String quote;
    String author;

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "author": author,
    };
}
