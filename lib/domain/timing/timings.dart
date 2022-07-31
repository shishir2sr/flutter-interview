import 'dart:convert';

import 'package:equatable/equatable.dart';

class Timings extends Equatable {
  final String fazar;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  const Timings({
    required this.fazar,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
  });

  Timings copyWith({
    String? fazar,
    String? sunrise,
    String? dhuhr,
    String? asr,
    String? sunset,
    String? maghrib,
    String? isha,
    String? imsak,
    String? midnight,
  }) {
    return Timings(
      fazar: fazar ?? this.fazar,
      sunrise: sunrise ?? this.sunrise,
      dhuhr: dhuhr ?? this.dhuhr,
      asr: asr ?? this.asr,
      sunset: sunset ?? this.sunset,
      maghrib: maghrib ?? this.maghrib,
      isha: isha ?? this.isha,
      imsak: imsak ?? this.imsak,
      midnight: midnight ?? this.midnight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Fajr': fazar,
      'Sunrise': sunrise,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Sunset': sunset,
      'Maghrib': maghrib,
      'Isha': isha,
      'Imsak': imsak,
      'Midnight': midnight,
    };
  }

  factory Timings.fromMap(Map<String, dynamic> map) {
    return Timings(
      fazar: map['Fajr'] ?? '',
      sunrise: map['Sunrise'] ?? '',
      dhuhr: map['Dhuhr'] ?? '',
      asr: map['Asr'] ?? '',
      sunset: map['Sunset'] ?? '',
      maghrib: map['Maghrib'] ?? '',
      isha: map['Isha'] ?? '',
      imsak: map['Imsak'] ?? '',
      midnight: map['Midnight'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Timings.fromJson(String source) =>
      Timings.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Timings(Fajr: $fazar, Sunrise: $sunrise, Dhuhr: $dhuhr, Asr: $asr, Sunset: $sunset, Maghrib: $maghrib, Isha: $isha, Imsak: $imsak, Midnight: $midnight)';
  }

  @override
  List<Object> get props {
    return [
      fazar,
      sunrise,
      dhuhr,
      asr,
      sunset,
      maghrib,
      isha,
      imsak,
      midnight,
    ];
  }
}
