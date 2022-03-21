import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/model/offer.dart';

abstract class BaseBooksRepository {
  Future<List<Book>> getAllBooks();
  Future<List<Offer>> getOffers(List<String> books);
}
