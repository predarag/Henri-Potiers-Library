import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henry_potiers_library/blocs/basket/basket_bloc.dart';
import 'package:henry_potiers_library/model/book.dart';

class BasketItemTile extends StatelessWidget {
  const BasketItemTile({
    Key? key,
    required this.book,
    required this.quantity,
  }) : super(key: key);

  final Book book;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
          tileColor: Theme.of(context).scaffoldBackgroundColor,
          leading: Container(
            height: 70,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(book.cover),
              ),
            ),
          ),
          title: Text(book.title, style: Theme.of(context).textTheme.headline5),
          subtitle: Text(
            '${quantity}X \$${book.price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () => context.read<BasketBloc>().add(
                  RemoveFromBasketEvent(book: book),
                ),
          )),
    );
  }
}
