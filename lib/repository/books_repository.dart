import 'package:henry_potiers_library/exceptions/books_exceptions.dart';
import 'package:henry_potiers_library/model/offer.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/repository/base_books_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converte;
import 'package:henry_potiers_library/extension/string_list_extension.dart';

class BooksRepository extends BaseBooksRepository {
  final String baseUrl = 'https://henri-potier.techx.fr/books';

  @override
  Future<List<Book>> getAllBooks() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = converte.jsonDecode(response.body) as List;
      return data.map((book) => Book.fromJson(book)).toList();
    }

    throw ErrorFetchingBooksException();
  }

  @override
  Future<List<Offer>> getOffers(List<String> books) async {
    final response = await http.get(
        Uri.parse('$baseUrl/${books.toCommaSeparated()}/commercialOffers'));
    if (response.statusCode == 200) {
      final data = converte.jsonDecode(response.body);
      final offers = data['offers'] as List;
      print(offers.toString());
      return offers.map((offer) => Offer.fromJson(offer)).toList();
    }
    throw ErrorFetchingOffersException();
  }
}
