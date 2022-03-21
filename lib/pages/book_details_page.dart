import 'package:flutter/material.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/widgets/basket_app_bar_icon.dart';
import 'package:henry_potiers_library/widgets/book_detail_bottom_bar.dart';
import 'package:henry_potiers_library/widgets/book_details_hero_image.dart';

class BookDetailsPage extends StatefulWidget {
  final Book book;
  const BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.book.title,
          overflow: TextOverflow.fade,
        ),
        actions: const [BasketAppBarIcon()],
      ),
      bottomNavigationBar: BookDetailBottomBar(book: widget.book),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookDetailsHeroImage(
                book: widget.book,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.book.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Synopis:',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 10,
              ),
              ...widget.book.synopsis.map(
                (text) => Text(
                  text,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
