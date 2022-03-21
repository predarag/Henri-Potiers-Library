import 'package:equatable/equatable.dart';
import 'package:henry_potiers_library/enums/offer_enum.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/model/offer.dart';
import 'package:collection/collection.dart';

class Basket extends Equatable {
  final List<Book> items;
  final List<Offer>? offers;

  const Basket({required this.items, this.offers});

  Basket copyWith({
    List<Book>? items,
    List<Offer>? offers,
  }) {
    return Basket(
      items: items ?? this.items,
      offers: offers ?? this.offers,
    );
  }

  Map<Book, int> itemQuantity(List<Book> items) {
    var qunatity = <Book, int>{};
    for (var item in items) {
      if (!qunatity.containsKey(item)) {
        qunatity[item] = 1;
      } else {
        qunatity.update(item, (value) => value + 1);
      }
    }

    return qunatity;
  }

  double? get subtotal =>
      items.fold(0, (total, curent) => total! + curent.price.toDouble());

  String? get subtotalString => subtotal?.toStringAsFixed(2);

  double? get total {
    return subtotal! - discount!;
  }

  String? get totalString => total?.toStringAsFixed(2);

  double? get discount {
    if (minusDiscount != null) {
      return minusDiscount!.value.toDouble();
    }

    if (percentageDiscount != null) {
      return subtotal! * (percentageDiscount!.value / 100);
    }

    return 0.0;
  }

  String? get discountString {
    return discount?.toStringAsFixed(2);
  }

  Offer? get minusDiscount => offers?.firstWhereOrNull(
        (element) => element.type == EOfferEnum.minus.name,
      );

  Offer? get percentageDiscount => offers?.firstWhereOrNull(
        (element) => element.type == EOfferEnum.percentage.name,
      );

  Offer? get refundOffer => offers?.firstWhereOrNull(
        (element) => element.type == EOfferEnum.slice.name,
      );

  String get refundString =>
      'For spent \$${refundOffer?.sliceValue.toString()} we will refund you \$${refundOffer?.value}';

  List<String> get allIsbns {
    List<String> isbns = [];

    items.forEach((item) {
      isbns.add(item.isbn);
    });

    return isbns;
  }

  @override
  List<Object?> get props => [items, offers];
}
