import 'package:flutter/material.dart';
import 'package:henry_potiers_library/model/book.dart';

class BookDetailsHeroImage extends StatelessWidget {
  final Book book;
  const BookDetailsHeroImage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: book.isbn,
        child: SizedBox(
          height: 320,
          width: 220,
          child: Stack(
            children: [
              Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(book.cover),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: -1,
                child: CircleAvatar(
                  radius: 33,
                  child: Text(
                    '\$${book.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
