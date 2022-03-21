part of 'books_bloc.dart';

abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksLoadingState extends BooksState {}

class BooksLoadedState extends BooksState {
  final List<Book> books;

  const BooksLoadedState({required this.books});

  @override
  List<Object> get props => [books];
}

class BooksErrorState extends BooksState {}
