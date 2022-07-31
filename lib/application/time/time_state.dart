import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:islamic_app/domain/timing/timedata.dart';
import 'package:islamic_app/hompage.dart';

import '../../domain/core/failure.dart';

class TimeState extends Equatable {
  final IList<TimeData> timeData;
  final bool loading;
  final Failure failure;
  final bool iftarAlert;
  const TimeState(
      {required this.timeData,
      required this.failure,
      required this.loading,
      required this.iftarAlert});

  TimeState copyWith({
    IList<TimeData>? timeData,
    bool? loading,
    Failure? failure,
    bool? iftarAlert,
  }) {
    return TimeState(
      timeData: timeData ?? this.timeData,
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      iftarAlert: iftarAlert ?? this.iftarAlert,
    );
  }

  @override
  List<Object> get props => [timeData, loading, failure, iftarAlert];

  @override
  String toString() =>
      'TimeState(timeData: $timeData, loading: $loading, failure: $failure)';

  factory TimeState.init() => TimeState(
        timeData: const IListConst<TimeData>([]),
        loading: false,
        failure: Failure.none(),
        iftarAlert: false,
      );
}
