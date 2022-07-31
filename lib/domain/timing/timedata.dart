import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:islamic_app/domain/timing/tdate.dart';
import 'package:islamic_app/domain/timing/timings.dart';

class TimeData extends Equatable {
  final Timings timings;
  final Tdate tdate;
  const TimeData({
    required this.timings,
    required this.tdate,
  });

  TimeData copyWith({
    Timings? timings,
    Tdate? tdate,
  }) {
    return TimeData(
      timings: timings ?? this.timings,
      tdate: tdate ?? this.tdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timings': timings.toMap(),
      'date': tdate.toMap(),
    };
  }

  factory TimeData.fromMap(Map<String, dynamic> map) {
    return TimeData(
      timings: Timings.fromMap(map['timings']),
      tdate: Tdate.fromMap(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TimeData.fromJson(String source) =>
      TimeData.fromMap(json.decode(source));

  @override
  String toString() => 'TimeData(timings: $timings, date: $tdate)';

  @override
  List<Object> get props => [timings, tdate];
}
