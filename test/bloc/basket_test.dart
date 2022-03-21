import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:henry_potiers_library/blocs/basket/basket_bloc.dart';
import 'package:henry_potiers_library/enums/offer_enum.dart';
import 'package:henry_potiers_library/model/basket.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/model/offer.dart';
import 'package:henry_potiers_library/repository/base_books_repository.dart';
import '../mock/book_repository_mock.dart';

void main() {
  List<Book> books = [];

  group('testing basket model', () {
    late BaseBooksRepository _booksRepository;
    setUp(() async {
      _booksRepository = BooksResposiotryMock();
      books = await _booksRepository.getAllBooks();
    });

    BasketBloc buildBloc() {
      return BasketBloc(booksRepository: _booksRepository);
    }

    blocTest<BasketBloc, BasketState>(
      'Should be BasketLoadingState ',
      build: buildBloc,
      verify: (state) => state is BasketLoadingState,
    );
    blocTest<BasketBloc, BasketState>(
      'Should be BasketLoadedState ',
      build: buildBloc,
      act: (bloc) => bloc.add(InitializeBasketEvent()),
      verify: (state) => state is BasketLoadedState,
    );
    blocTest<BasketBloc, BasketState>(
      'Add one item to basket state',
      build: buildBloc,
      seed: () => const BasketLoadedState(
          basket: Basket(
        items: [],
      )),
      act: (bloc) => bloc.add(
        AddToBasketEvent(book: books[0]),
      ),
      expect: () => [
        AddedToBasketState(),
        BasketLoadedState(
          basket: Basket(
            items: [books[0]],
            offers: [
              Offer(type: EOfferEnum.percentage.name, value: 4),
            ],
          ),
        )
      ],
    );
    blocTest<BasketBloc, BasketState>(
      'Add 2 items to basket state',
      build: buildBloc,
      seed: () => const BasketLoadedState(
          basket: Basket(
        items: [],
      )),
      act: (bloc) => bloc
        ..add(
          AddToBasketEvent(book: books[0]),
        )
        ..add(AddToBasketEvent(book: books[1])),
      expect: () => [
        AddedToBasketState(),
        BasketLoadedState(
          basket: Basket(
            items: [books[0]],
            offers: [
              Offer(type: EOfferEnum.percentage.name, value: 4),
            ],
          ),
        ),
        AddedToBasketState(),
        BasketLoadedState(
          basket: Basket(
            items: [books[0], books[1]],
            offers: [
              Offer(type: EOfferEnum.percentage.name, value: 8),
              Offer(type: EOfferEnum.minus.name, value: 15),
            ],
          ),
        )
      ],
    );
    blocTest<BasketBloc, BasketState>(
      'Add 3 items to basket state',
      build: buildBloc,
      seed: () => const BasketLoadedState(
          basket: Basket(
        items: [],
      )),
      act: (bloc) => bloc
        ..add(
          AddToBasketEvent(book: books[0]),
        )
        ..add(
          AddToBasketEvent(book: books[1]),
        )
        ..add(
          AddToBasketEvent(book: books[2]),
        ),
      expect: () => [
        AddedToBasketState(),
        BasketLoadedState(
          basket: Basket(
            items: [books[0]],
            offers: [
              Offer(type: EOfferEnum.percentage.name, value: 4),
            ],
          ),
        ),
        AddedToBasketState(),
        BasketLoadedState(
          basket: Basket(
            items: [books[0], books[1]],
            offers: [
              Offer(type: EOfferEnum.percentage.name, value: 8),
              Offer(type: EOfferEnum.minus.name, value: 15),
            ],
          ),
        ),
        AddedToBasketState(),
        BasketLoadedState(
          basket: Basket(
            items: [books[0], books[1], books[2]],
            offers: [
              Offer(type: EOfferEnum.percentage.name, value: 8),
              Offer(type: EOfferEnum.minus.name, value: 30),
              Offer(type: EOfferEnum.slice.name, value: 100, sliceValue: 12)
            ],
          ),
        )
      ],
    );
    blocTest<BasketBloc, BasketState>(
      'Remove item from basket',
      build: buildBloc,
      seed: () => BasketLoadedState(
        basket: Basket(items: [
          books[0],
          books[1]
        ], offers: [
          Offer(type: EOfferEnum.percentage.name, value: 8),
          Offer(type: EOfferEnum.minus.name, value: 15),
        ]),
      ),
      act: (bloc) => bloc.add(RemoveFromBasketEvent(book: books[0])),
      expect: () => [
        RemovedFromBasketState(),
        BasketLoadedState(
          basket: Basket(
            items: [books[1]],
            offers: [
              Offer(type: EOfferEnum.percentage.name, value: 4),
            ],
          ),
        ),
      ],
    );
  });
}
