import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/book.dart';
import 'book_container.dart';

class BooksGridWidget extends StatelessWidget {
  final List<Book> books;

  const BooksGridWidget({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: (() => context.pushNamed('book-details', extra: book)),
            child: BookContainer(book: book),
          );
        },
      ),
    );
  }
}
