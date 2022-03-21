import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/basket/basket_bloc.dart';

class BasketAppBarIcon extends StatelessWidget {
  const BasketAppBarIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            context.pushNamed('basket');
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            if (state is BasketLoadedState) {
              if (state.basket.items.isNotEmpty) {
                return Positioned(
                  right: 3,
                  top: 3,
                  child: CircleAvatar(
                    radius: 10,
                    child: Text(
                      state.basket.items.length.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              }
            }
            return const SizedBox();
          },
        )
      ],
    );
  }
}
