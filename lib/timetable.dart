import 'package:flutter/material.dart';

class TimeTable {
  String azantitle;
  String azantime;
  Icon azanicon;
  TimeTable({
    required this.azantitle,
    required this.azantime,
    required this.azanicon,
  });

  TimeTable copyWith({
    String? azantitle,
    String? azantime,
    Icon? azanicon,
  }) {
    return TimeTable(
      azantitle: azantitle ?? this.azantitle,
      azantime: azantime ?? this.azantime,
      azanicon: azanicon ?? this.azanicon,
    );
  }

  @override
  String toString() =>
      'TimeTable(azantitle: $azantitle, azantime: $azantime, azanicon: $azanicon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimeTable &&
        other.azantitle == azantitle &&
        other.azantime == azantime &&
        other.azanicon == azanicon;
  }

  @override
  int get hashCode =>
      azantitle.hashCode ^ azantime.hashCode ^ azanicon.hashCode;
}
