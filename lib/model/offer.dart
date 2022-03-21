import 'package:equatable/equatable.dart';

class Offer extends Equatable {
  final String type;
  final int value;
  final int? sliceValue;

  Offer({
    required this.type,
    required this.value,
    this.sliceValue,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      type: json['type'],
      value: json['value'],
      sliceValue: json['sliceValue'],
    );
  }

  @override
  String toString() {
    return '$type $value';
  }

  @override
  List<Object?> get props => [type, value, sliceValue];
}
