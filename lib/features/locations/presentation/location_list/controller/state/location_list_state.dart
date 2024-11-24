import 'package:faks/features/locations/domain/model/location.dart';

sealed class LocationListState {}

class LoadingState extends LocationListState {}

class FilledState extends LocationListState {
  final List<Location> locations;

  FilledState(this.locations);
}

class EmptyState extends LocationListState {}

class ErrorState extends LocationListState {
  final String message;

  ErrorState(this.message);
}