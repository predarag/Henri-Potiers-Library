import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/repository/base_books_repository.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BaseBooksRepository _booksRepository;
  BooksBloc({
    required BaseBooksRepository booksRepository,
  })  : _booksRepository = booksRepository,
        super(BooksLoadingState()) {
    on<BooksLoadEvent>((event, emit) async {
      emit(BooksLoadingState());
      final books = await _booksRepository.getAllBooks();
      emit(BooksLoadedState(books: books));
      try {} catch (_) {
        emit(BooksErrorState());
      }
    });
  }
}
