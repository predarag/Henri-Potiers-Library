import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henry_potiers_library/blocs/basket/basket_bloc.dart';
import 'package:henry_potiers_library/utils/dialogs.dart';
import 'package:henry_potiers_library/widgets/basket_item_tile.dart';
import 'package:henry_potiers_library/widgets/basket_price_container.dart';
import 'package:henry_potiers_library/widgets/empty_basket.dart';
import 'package:henry_potiers_library/widgets/refund_row.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BasketBloc, BasketState>(
      listener: (context, state) {
        if (state is RemovedFromBasketState) {
          showSnackBar(context, 'Item removed from basket');
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(
            'Your Basket',
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: Colors.white),
          ),
        ),
        body: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            if (state is BasketLoadedState) {
              if (state.basket.items.isEmpty) {
                return const EmptyBasket();
              }

              final items = state.basket.itemQuantity(state.basket.items);

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Items',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        key: UniqueKey(),
                        shrinkWrap: true,
                        itemCount: items.keys.length,
                        itemBuilder: ((context, index) {
                          final book = items.keys.elementAt(index);
                          final quantity = items.entries.elementAt(index).value;
                          return BasketItemTile(
                            key: UniqueKey(),
                            book: book,
                            quantity: quantity,
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BasketPriceContainer(
                        key: UniqueKey(),
                        basket: state.basket,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (state.basket.refundOffer != null)
                        RefundRow(
                          refundString: state.basket.refundString,
                        ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: Text('Something went wrong..'),
            );
          },
        ),
      ),
    );
  }
}
