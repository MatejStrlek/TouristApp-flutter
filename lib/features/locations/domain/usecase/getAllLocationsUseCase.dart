import 'package:dartz/dartz.dart';
import 'package:faks/core/error/failure.dart';
import 'package:faks/features/locations/domain/model/location.dart';
import 'package:faks/features/locations/domain/repository/location_repository.dart';

class GetAllLocationsUseCase {
  final LocationRepository _locationRepository;

  GetAllLocationsUseCase(this._locationRepository);

  Future<Either<Failure, List<Location>>> call() => _locationRepository.getAllLocations();
}