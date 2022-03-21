import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:henry_potiers_library/model/basket.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/model/offer.dart';
import 'package:henry_potiers_library/repository/base_books_repository.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final BaseBooksRepository _booksRepository;
  BasketBloc({required BaseBooksRepository booksRepository})
      : _booksRepository = booksRepository,
        super(BasketLoadingState()) {
    on<InitializeBasketEvent>((event, emit) async {
      emit(const BasketLoadedState(basket: Basket(items: [])));
    });

    on<AddToBasketEvent>(
      (event, emit) async {
        if (state is BasketLoadedState) {
          final basketState = state as BasketLoadedState;

          final List<Book> items = List.from(basketState.basket.items)
            ..add(event.book);

          final offers = await loadOffers(basketState, items);
          emitBasketStates(
              emit, AddedToBasketState(), basketState, items, offers);
        }
      },
    );
    on<RemoveFromBasketEvent>(
      (event, emit) async {
        if (state is BasketLoadedState) {
          final basketState = state as BasketLoadedState;

          final List<Book> items = List.from(basketState.basket.items)
            ..remove(event.book);

          final offers = await loadOffers(basketState, items);
          emitBasketStates(
              emit, RemovedFromBasketState(), basketState, items, offers);
        }
      },
    );
  }

  Future<List<Offer>> loadOffers(
      BasketLoadedState basketState, List<Book> items) async {
    final basket = basketState.basket.copyWith(
      items: items,
    );

    List<Offer> offers = [];

    try {
      offers = await _booksRepository.getOffers(basket.allIsbns);
    } catch (_) {}
    return offers;
  }

  void emitBasketStates(Emitter<BasketState> emit, BasketState actionState,
      BasketLoadedState basketState, List<Book> items, List<Offer> offers) {
    emit(actionState);
    emit(
      BasketLoadedState(
        basket: basketState.basket.copyWith(items: items, offers: offers),
      ),
    );
  }
}
