import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/pages/basket_page.dart';
import 'package:henry_potiers_library/pages/book_details_page.dart';
import 'package:henry_potiers_library/pages/home_page.dart';

final GoRouter routes = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: '/basket',
      name: 'basket',
      builder: (BuildContext context, GoRouterState state) =>
          const BasketPage(),
    ),
    GoRoute(
      path: '/book-details',
      name: 'book-details',
      builder: (BuildContext context, GoRouterState state) => BookDetailsPage(
        book: state.extra! as Book,
      ),
    )
  ],
);
