import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:islamic_app/domain/timing/hijri.dart';

class Tdate extends Equatable {
  final String timestamp;
  final Hijri hijri;
  const Tdate({
    required this.timestamp,
    required this.hijri,
  });

  Tdate copyWith({
    String? timestamp,
    Hijri? hijri,
  }) {
    return Tdate(
      timestamp: timestamp ?? this.timestamp,
      hijri: hijri ?? this.hijri,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp,
      'hijri': hijri.toMap(),
    };
  }

  factory Tdate.fromMap(Map<String, dynamic> map) {
    return Tdate(
      timestamp: map['timestamp'] ?? '',
      hijri: Hijri.fromMap(map['hijri']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tdate.fromJson(String source) => Tdate.fromMap(json.decode(source));

  @override
  String toString() => 'Tdate(timestamp: $timestamp, hijri: $hijri)';

  @override
  List<Object> get props => [timestamp, hijri];
}
