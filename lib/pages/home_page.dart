import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henry_potiers_library/blocs/basket/basket_bloc.dart';
import 'package:henry_potiers_library/blocs/book/books_bloc.dart';
import 'package:henry_potiers_library/utils/dialogs.dart';
import 'package:henry_potiers_library/widgets/books_grid_widget.dart';
import 'package:henry_potiers_library/widgets/basket_app_bar_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Henri Potier\'s Library',
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: Colors.white),
        ),
        actions: const [
          BasketAppBarIcon(),
        ],
      ),
      body: BlocListener<BasketBloc, BasketState>(
        listener: (context, state) {
          if (state is AddedToBasketState) {
            showSnackBar(context, 'Item added to basket');
          }
        },
        child: BlocBuilder<BooksBloc, BooksState>(
          builder: ((context, state) {
            if (state is BooksLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BooksLoadedState) {
              return BooksGridWidget(books: state.books);
            } else if (state is BooksErrorState) {
              return const Center(
                child: Text('Error while loading books..'),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
