import 'package:faks/core/di.dart';
import 'package:faks/features/locations/domain/model/location.dart';
import 'package:faks/features/locations/domain/usecase/get_all_favorite_locations_use_case.dart';
import 'package:faks/features/locations/domain/usecase/remove_location_as_favorite_use_case.dart';
import 'package:faks/features/locations/domain/usecase/set_location_as_favorite_use_case.dart';
import 'package:faks/features/locations/presentation/favorite_list/controller/state/favorite_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteListController extends Notifier<FavoriteListState> {
  late final GetAllFavoriteLocationsUseCase _getFavoriteList;
  late final SetLocationAsFavoriteUseCase _setAsFavorite;
  late final RemoveLocationAsFavoriteUseCase _removeAsFavorite;

  @override
  FavoriteListState build() {
    _getFavoriteList = ref.watch(getAllFavoriteLocationsUseCaseProvider);
    _setAsFavorite = ref.watch(setLocationAsFavoriteUseCaseProvider);
    _removeAsFavorite = ref.watch(removeLocationAsFavoriteUseCaseProvider);

    return getAllFavorites();
  }

  FavoriteListState getAllFavorites() {
    state = _getFavoriteList().isEmpty ? EmptyState() : FilledState(_getFavoriteList());
    return state;
  }
  void setAsFavorite(final Location location) {
    _setAsFavorite(location);
    getAllFavorites();
  }
  void removeAsFavorite(final Location location) {
    _removeAsFavorite(location);
    getAllFavorites();
  }
}