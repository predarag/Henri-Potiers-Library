import 'package:flutter/material.dart';
import 'package:henry_potiers_library/model/basket.dart';

class BasketPriceContainer extends StatelessWidget {
  final Basket basket;
  const BasketPriceContainer({Key? key, required this.basket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price:',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text('\$${basket.subtotalString}',
                  style: Theme.of(context).textTheme.headline5),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount:',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text('\$${basket.discountString}',
                  style: Theme.of(context).textTheme.headline5),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total:',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text('\$${basket.totalString}',
                  style: Theme.of(context).textTheme.headline3),
            ],
          )
        ]),
      ),
    );
  }
}
