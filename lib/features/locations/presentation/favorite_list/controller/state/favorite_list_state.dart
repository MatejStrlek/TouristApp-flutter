import 'package:faks/features/locations/domain/model/location.dart';

sealed class FavoriteListState {}

class FilledState extends FavoriteListState {
  final List<Location> favoriteLocations;

  FilledState(this.favoriteLocations);
}

class EmptyState extends FavoriteListState {}