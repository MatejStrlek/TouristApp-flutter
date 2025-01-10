import 'package:faks/features/locations/data/database/location_entity.dart';

abstract interface class DatabaseManager {
  List<LocationEntity> getAllLocations();
  void insertLocation(LocationEntity location);
  void removeLocation(LocationEntity location);
}