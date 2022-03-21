import 'package:flutter_test/flutter_test.dart';
import 'package:henry_potiers_library/enums/offer_enum.dart';
import 'package:henry_potiers_library/model/basket.dart';
import 'package:henry_potiers_library/model/book.dart';
import 'package:henry_potiers_library/model/offer.dart';

void main() {
  group('Test basket model', () {
    test('Basket should be empty', () {
      const basket = Basket(items: []);
      expect(basket.items, []);
      expect(basket.offers, null);

      expect(basket.subtotal, 0.0);
      expect(basket.subtotalString, '0.00');
      expect(basket.discount, 0.0);
      expect(basket.discountString, '0.00');
      expect(basket.total, 0.0);
      expect(basket.totalString, '0.00');

      expect(basket.allIsbns, []);

      expect(basket.minusDiscount, null);
      expect(basket.percentageDiscount, null);
      expect(basket.refundOffer, null);
    });

    test('Should contain 1 item, and no offers', () {
      final basket = Basket(
        items: [
          Book(
            isbn: '1234',
            title: 'Test book',
            price: 20,
            cover: 'Test synopis',
            synopsis: const ['Test string 1', 'Test string 2'],
          ),
        ],
      );
      expect(basket.items.length, 1);
      expect(basket.offers, null);

      expect(basket.subtotal, 20.0);
      expect(basket.subtotalString, '20.00');
      expect(basket.discount, 0.0);
      expect(basket.discountString, '0.00');
      expect(basket.total, 20.0);

      expect(basket.totalString, '20.00');

      expect(basket.allIsbns, ['1234']);

      expect(basket.minusDiscount, null);
      expect(basket.percentageDiscount, null);
      expect(basket.refundOffer, null);
    });

    test('Should contain 1 item, and 1 offer', () {
      final basket = Basket(items: [
        Book(
          isbn: '1234',
          title: 'Test book',
          price: 20,
          cover: 'Test synopis',
          synopsis: const ['Test string 1', 'Test string 2'],
        ),
      ], offers: [
        Offer(
          type: EOfferEnum.percentage.name,
          value: 10,
        ),
      ]);
      expect(basket.items.length, 1);
      expect(basket.offers?.length, 1);

      expect(basket.subtotal, 20.0);
      expect(basket.subtotalString, '20.00');
      expect(basket.discount, 2.0);
      expect(basket.discountString, '2.00');
      expect(basket.total, 18.0);

      expect(basket.totalString, '18.00');

      expect(basket.allIsbns, ['1234']);

      expect(basket.minusDiscount, null);
      expect(basket.percentageDiscount, isA<Offer>());
      expect(basket.refundOffer, null);
    });
    test('Should contain 2 items, and 3 offers', () {
      final basket = Basket(items: [
        Book(
          isbn: '1234',
          title: 'Test book',
          price: 20,
          cover: 'Test synopis',
          synopsis: const ['Test string 1', 'Test string 2'],
        ),
        Book(
          isbn: '123456',
          title: 'Test book 2',
          price: 25,
          cover: 'Test synopis',
          synopsis: const ['Test string 1', 'Test string 2'],
        ),
      ], offers: [
        Offer(
          type: EOfferEnum.percentage.name,
          value: 10,
        ),
        Offer(
          type: EOfferEnum.minus.name,
          value: 15,
        ),
        Offer(
          type: EOfferEnum.slice.name,
          value: 80,
          sliceValue: 10,
        ),
      ]);
      expect(basket.items.length, 2);
      expect(basket.offers?.length, 3);

      expect(basket.subtotal, 45.0);
      expect(basket.subtotalString, '45.00');
      expect(basket.discount, 15.0);
      expect(basket.discountString, '15.00');
      expect(basket.total, 30.0);
      expect(basket.totalString, '30.00');

      expect(basket.allIsbns, ['1234', '123456']);

      expect(basket.minusDiscount, isA<Offer>());
      expect(basket.percentageDiscount, isA<Offer>());
      expect(basket.refundOffer, isA<Offer>());
    });
  });
}
