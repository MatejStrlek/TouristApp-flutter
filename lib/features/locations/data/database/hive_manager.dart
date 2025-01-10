import 'package:faks/features/locations/data/database/database_manager.dart';
import 'package:faks/features/locations/data/database/location_entity.dart';
import 'package:hive_flutter/adapters.dart';

class HiveManager implements DatabaseManager {
  static const String _boxName = 'locations';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LocationEntityAdapter());
    await Hive.openBox<LocationEntity>(_boxName);
  }

  @override
  List<LocationEntity> getAllLocations() {
    return Hive.box<LocationEntity>(_boxName).values.toList();
  }

  @override
  void insertLocation(final LocationEntity location) {
    Hive.box<LocationEntity>(_boxName).put(location.id, location);
  }

  @override
  void removeLocation(final LocationEntity location) {
    Hive.box<LocationEntity>(_boxName).delete(location.id);
  }
}