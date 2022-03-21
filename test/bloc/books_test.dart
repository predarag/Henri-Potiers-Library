import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:henry_potiers_library/blocs/book/books_bloc.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/repository/base_books_repository.dart';

import '../mock/book_repository_mock.dart';

main() {
  List<Book> books = [];

  group('Test books BLOC', () {
    late BaseBooksRepository _booksRepository;
    setUp(() async {
      _booksRepository = BooksResposiotryMock();
      books = await _booksRepository.getAllBooks();
    });

    BooksBloc buildBloc() {
      return BooksBloc(booksRepository: _booksRepository);
    }

    blocTest<BooksBloc, BooksState>(
      'Should be BooksLoadingState ',
      build: buildBloc,
      verify: (state) => state is BooksLoadingState,
    );
    blocTest<BooksBloc, BooksState>(
      'Should load books',
      build: buildBloc,
      act: (bloc) => bloc.add(BooksLoadEvent()),
      expect: () => [
        BooksLoadingState(),
        BooksLoadedState(
          books: books,
        ),
      ],
    );
  });
}
