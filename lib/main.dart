import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henry_potiers_library/blocs/basket/basket_bloc.dart';
import 'package:henry_potiers_library/blocs/book/books_bloc.dart';
import 'package:henry_potiers_library/navigation/routes.dart';
import 'package:henry_potiers_library/repository/base_books_repository.dart';
import 'package:henry_potiers_library/repository/books_repository.dart';
import 'package:henry_potiers_library/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BaseBooksRepository>(
          create: ((context) => BooksRepository()),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: ((context) => BooksBloc(
                  booksRepository: context.read<BaseBooksRepository>(),
                )..add(
                    BooksLoadEvent(),
                  )),
          ),
          BlocProvider(
            create: ((context) => BasketBloc(
                  booksRepository: context.read<BaseBooksRepository>(),
                )..add(
                    InitializeBasketEvent(),
                  )),
          )
        ],
        child: MaterialApp.router(
          title: 'Henri Potier\'s Library',
          theme: theme(),
          routeInformationParser: routes.routeInformationParser,
          routerDelegate: routes.routerDelegate,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
