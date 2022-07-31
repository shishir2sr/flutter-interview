import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weekday extends Equatable {
  final String en;
  final int number;
  const Weekday({
    required this.en,
    required this.number,
  });

  Weekday copyWith({
    String? en,
    int? number,
  }) {
    return Weekday(
      en: en ?? this.en,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
      'number': number,
    };
  }

  factory Weekday.fromMap(Map<String, dynamic> map) {
    return Weekday(
      en: map['en'] ?? '',
      number: map['number']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weekday.fromJson(String source) =>
      Weekday.fromMap(json.decode(source));

  @override
  String toString() => 'Weekday(en: $en, number: $number)';

  @override
  List<Object> get props => [en, number];
}
