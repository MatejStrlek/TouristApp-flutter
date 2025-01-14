import 'package:dartz/dartz.dart';
import 'package:faks/core/error/failure.dart';
import 'package:faks/features/locations/data/api/location_api.dart';
import 'package:faks/features/locations/data/database/database_manager.dart';
import 'package:faks/features/locations/data/database/location_entity.dart';
import 'package:faks/features/locations/data/mapper/location_entity_to_domain_mapper.dart';
import 'package:faks/features/locations/domain/model/location.dart';
import 'package:faks/features/locations/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationApi _locationApi;
  final DatabaseManager _databaseManager;

  const LocationRepositoryImpl(this._locationApi, this._databaseManager);

  @override
  Future<Either<Failure, List<Location>>> getAllLocations() async {
    try {
      final response = await _locationApi.getAllLocations();
      final favorites = _databaseManager.getAllLocations();

      final result = _applyFavoriteFlags(response, favorites);

      return Right(result);
    } catch (e) {
      return Left(NetworkFailure("Error fetching locations"));
    }
  }

  List<Location> _applyFavoriteFlags(final List<Location> response, final List<LocationEntity> favorites) {
    for (var location in response) {
      if (favorites.contains(LocationEntityToDomainMapper().revert(location))) {
        location.isFavorite = true;
      }
    }
    return response;
  }

  @override
  void setAsFavorite(final Location location) {
    LocationEntity locationEntity = LocationEntityToDomainMapper().revert(location);
    _databaseManager.insertLocation(locationEntity);
  }

  @override
  void removeAsFavorite(final Location location) {
    LocationEntity locationEntity = LocationEntityToDomainMapper().revert(location);
    _databaseManager.removeLocation(locationEntity);
  }

  @override
  List<Location> getFavoriteLocations() {
    return _databaseManager.getAllLocations().map((e) => LocationEntityToDomainMapper().convert(e)).toList();
  }
}