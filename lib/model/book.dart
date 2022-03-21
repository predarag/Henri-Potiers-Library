import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String isbn;
  final String title;
  final int price;
  final String cover;
  final List<String> synopsis;

  Book({
    required this.isbn,
    required this.title,
    required this.price,
    required this.cover,
    required this.synopsis,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        isbn: json['isbn'],
        title: json['title'],
        price: json['price'],
        cover: json['cover'],
        synopsis: List<String>.from(json["synopsis"].map((x) => x)));
  }

  @override
  String toString() {
    return '$isbn $title $price';
  }

  @override
  List<Object?> get props => [isbn, title, price, cover, synopsis];
}
