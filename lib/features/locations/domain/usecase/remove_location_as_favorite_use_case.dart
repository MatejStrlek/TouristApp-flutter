import '../model/location.dart';
import '../repository/location_repository.dart';

class RemoveLocationAsFavoriteUseCase {
  final LocationRepository _repository;

  RemoveLocationAsFavoriteUseCase(this._repository);

  void call(final Location location) {
    _repository.removeAsFavorite(location);
  }
}