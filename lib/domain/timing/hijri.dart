import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:islamic_app/domain/timing/month.dart';
import 'package:islamic_app/domain/timing/weekday.dart';

class Hijri extends Equatable {
  final String day;
  final Weekday weekDay;
  final Month month;
  final String year;
  final List<String> holidays;
  const Hijri({
    required this.day,
    required this.weekDay,
    required this.month,
    required this.year,
    required this.holidays,
  });

  Hijri copyWith({
    String? day,
    Weekday? weekDay,
    Month? month,
    String? year,
    List<String>? holidays,
  }) {
    return Hijri(
      day: day ?? this.day,
      weekDay: weekDay ?? this.weekDay,
      month: month ?? this.month,
      year: year ?? this.year,
      holidays: holidays ?? this.holidays,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'weekday': weekDay.toMap(),
      'month': month.toMap(),
      'year': year,
      'holidays': holidays,
    };
  }

  factory Hijri.fromMap(Map<String, dynamic> map) {
    return Hijri(
      day: map['day'] ?? '',
      weekDay: Weekday.fromMap(map['weekday']),
      month: Month.fromMap(map['month']),
      year: map['year'] ?? '',
      holidays: List<String>.from(map['holidays']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Hijri.fromJson(String source) => Hijri.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hijri(day: $day, weekday: $weekDay, month: $month, year: $year, holidays: $holidays)';
  }

  @override
  List<Object> get props {
    return [
      day,
      weekDay,
      month,
      year,
      holidays,
    ];
  }
}
