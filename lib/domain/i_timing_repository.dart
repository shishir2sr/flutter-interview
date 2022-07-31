import 'package:clean_api/clean_api.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:islamic_app/domain/core/failure.dart';

import 'package:islamic_app/domain/timing/timedata.dart';

abstract class ITimingRepository {
  Future<Either<Failure, IList<TimeData>>> getTimings();
}
