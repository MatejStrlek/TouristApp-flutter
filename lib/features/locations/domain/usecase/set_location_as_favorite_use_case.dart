import '../model/location.dart';
import '../repository/location_repository.dart';

class SetLocationAsFavoriteUseCase {
  final LocationRepository _repository;

  SetLocationAsFavoriteUseCase(this._repository);

  void call(final Location location) {
    _repository.setAsFavorite(location);
  }
}