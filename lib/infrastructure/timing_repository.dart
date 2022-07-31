import 'package:clean_api/clean_api.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:islamic_app/domain/core/failure.dart';
import 'package:islamic_app/domain/i_timing_repository.dart';
import '../domain/timing/timedata.dart';

class TimingRepo extends ITimingRepository {
  final api = CleanApi.instance();

  @override
  Future<Either<Failure, IList<TimeData>>> getTimings() async {
    final result = await api.get(
        endPoint:
            '/calendar?latitude=23.785020228786177&longitude=90.34010402024623&month=3&year=2022',
        fromJson: (json) {
          final listJson = json["data"] as List;
          final timeList =
              List<TimeData>.from(listJson.map((e) => TimeData.fromMap(e)));

          return timeList.lock;
        });
    Logger.i(result);
    return result.fold(
        (l) => left(Failure(error: l.error, type: l.tag)), (r) => right(r));
  }
}
