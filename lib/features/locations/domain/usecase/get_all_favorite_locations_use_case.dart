import 'package:faks/features/locations/domain/model/location.dart';
import 'package:faks/features/locations/domain/repository/location_repository.dart';

class GetAllFavoriteLocationsUseCase {
  final LocationRepository _locationRepository;

  GetAllFavoriteLocationsUseCase(this._locationRepository);

  List<Location> call() {
    return _locationRepository.getFavoriteLocations();
  }
}