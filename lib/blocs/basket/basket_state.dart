part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}

class BasketInitial extends BasketState {
  @override
  List<Object> get props => [];
}

class BasketLoadingState extends BasketState {}

class BasketLoadedState extends BasketState {
  final Basket basket;

  const BasketLoadedState({required this.basket});

  @override
  List<Object> get props => [basket];

  @override
  bool operator ==(other) =>
      other is BasketLoadedState && other.basket == basket;

  @override
  int get hashCode => basket.hashCode;
}

class AddedToBasketState extends BasketState {
  @override
  List<Object> get props => [];
}

class RemovedFromBasketState extends BasketState {
  @override
  List<Object> get props => [];
}

class BasketErrorState extends BasketState {}
