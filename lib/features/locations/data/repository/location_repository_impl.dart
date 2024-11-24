import 'package:dartz/dartz.dart';
import 'package:faks/core/error/failure.dart';
import 'package:faks/features/locations/data/api/location_api.dart';
import 'package:faks/features/locations/domain/model/location.dart';
import 'package:faks/features/locations/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationApi _locationApi;

  const LocationRepositoryImpl(this._locationApi);

  @override
  Future<Either<Failure, List<Location>>> getAllLocations() async {
    try {
      final result = await _locationApi.getAllLocations();
      return Right(result);
    } catch (e) {
      return Left(NetworkFailure("Error fetching locations"));
    }
  }
}