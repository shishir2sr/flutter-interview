import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islamic_app/application/time/time_state.dart';

import '../../domain/i_timing_repository.dart';
import '../../infrastructure/timing_repository.dart';

final timeProvider = StateNotifierProvider<GetTimeNotifier, TimeState>((ref) {
  return GetTimeNotifier(TimingRepo());
});

class GetTimeNotifier extends StateNotifier<TimeState> {
  final ITimingRepository timingRepository;

  GetTimeNotifier(this.timingRepository) : super(TimeState.init());
  setIftarAlert(bool newIftarAlert) {
    state = state.copyWith(iftarAlert: newIftarAlert);
  }

  Future<void> getTimes() async {
    state = state.copyWith(loading: true);
    final response = await timingRepository.getTimings();

    state = response.fold((l) => state.copyWith(loading: false, failure: l),
        (r) => state.copyWith(loading: false, timeData: r));
  }
}
