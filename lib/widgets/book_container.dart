import 'package:flutter/material.dart';
import 'package:henry_potiers_library/widgets/book_footer.dart';

import '../model/book.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: book.isbn,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    book.cover,
                  ),
                  fit: BoxFit.cover),
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
          ),
        ),
        BookFooter(book: book)
      ],
    );
  }
}
