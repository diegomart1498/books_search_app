import 'dart:convert';

class NewBooksReponseModel {
  final String error;
  final String total;
  final List<Book> books;

  NewBooksReponseModel({
    required this.error,
    required this.total,
    required this.books,
  });

  factory NewBooksReponseModel.fromRawJson(String str) =>
      NewBooksReponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewBooksReponseModel.fromJson(Map<String, dynamic> json) =>
      NewBooksReponseModel(
        error: json["error"],
        total: json["total"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}

class Book {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory Book.fromRawJson(String str) => Book.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
      };
}
