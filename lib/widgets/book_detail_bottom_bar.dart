import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henry_potiers_library/blocs/basket/basket_bloc.dart';
import 'package:henry_potiers_library/model/book.dart';

class BookDetailBottomBar extends StatelessWidget {
  const BookDetailBottomBar({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.transparent,
      child: Center(
        child: ElevatedButton(
          child: const Text('Add to Basket'),
          onPressed: () {
            context.read<BasketBloc>().add(AddToBasketEvent(book: book));
          },
        ),
      ),
    );
  }
}
