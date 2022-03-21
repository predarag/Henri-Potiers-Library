import 'package:henry_potiers_library/enums/offer_enum.dart';
import 'package:henry_potiers_library/exceptions/books_exceptions.dart';
import 'package:henry_potiers_library/model/offer.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/repository/base_books_repository.dart';

class BooksResposiotryMock extends BaseBooksRepository {
  final List<Book> books = [
    Book(
      isbn: 'c8fabf68-8374-48fe-a7ea-a00ccd07afff',
      title: 'Henri Potier à l\'école des sorciers',
      price: 35,
      cover:
          'https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media',
      synopsis: ['Test synopis 1'],
    ),
    Book(
      isbn: 'a460afed-e5e7-4e39-a39d-c885c05db861',
      title: 'Henri Potier et la Chambre des secrets',
      price: 30,
      cover:
          'https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media',
      synopsis: ['Test synopis 2', 'Test other synopis'],
    ),
    Book(
      isbn: 'fcd1e6fa-a63f-4f75-9da4-b560020b6acc',
      title: 'Henri Potier et le Prisonnier d\'Azkaban',
      price: 29,
      cover:
          'https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media',
      synopsis: ['Test synopis 3'],
    ),
  ];

  @override
  Future<List<Book>> getAllBooks() async {
    Future.delayed(const Duration(seconds: 1));

    return books;
  }

  @override
  Future<List<Offer>> getOffers(List<String> books) async {
    if (books.isEmpty) throw ErrorFetchingOffersException();

    Future.delayed(const Duration(seconds: 1));

    List<Offer> offers = [];

    if (books.length == 1) {
      offers.add(Offer(type: EOfferEnum.percentage.name, value: 4));
    }

    if (books.length == 2) {
      offers.add(Offer(type: EOfferEnum.percentage.name, value: 8));
      offers.add(Offer(type: EOfferEnum.minus.name, value: 15));
    }

    if (books.length == 3) {
      offers.add(Offer(type: EOfferEnum.percentage.name, value: 8));
      offers.add(Offer(type: EOfferEnum.minus.name, value: 30));
      offers
          .add(Offer(type: EOfferEnum.slice.name, value: 100, sliceValue: 12));
    }

    return offers;
  }
}
