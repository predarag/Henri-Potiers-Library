import 'package:flutter/material.dart';

class EmptyBasket extends StatelessWidget {
  const EmptyBasket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your basket is empty',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1?.copyWith(),
          ),
          const SizedBox(
            height: 20,
          ),
          Icon(
            Icons.remove_shopping_cart_outlined,
            size: 60,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
