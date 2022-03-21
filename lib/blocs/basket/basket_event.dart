part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class InitializeBasketEvent extends BasketEvent {}

class LoadBasketOffersEvent extends BasketEvent {}

class AddToBasketEvent extends BasketEvent {
  final Book book;

  const AddToBasketEvent({required this.book});

  @override
  List<Object> get props => [book];
}

class RemoveFromBasketEvent extends BasketEvent {
  final Book book;

  const RemoveFromBasketEvent({required this.book});

  @override
  List<Object> get props => [book];
}
