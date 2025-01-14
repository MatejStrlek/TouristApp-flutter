import 'package:faks/features/locations/data/mapper/mapper.dart';
import 'package:faks/features/locations/domain/model/location.dart';

import '../database/location_entity.dart';

class LocationEntityToDomainMapper implements Mapper<LocationEntity, Location> {
  @override
  Location convert(LocationEntity entity) {
    return Location(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      address: entity.address,
      lat: entity.lat,
      lng: entity.lng,
      rating: entity.rating,
      imageUrl: entity.imageUrl,
      isFavorite: entity.isFavorite,
    );
  }

  @override
  LocationEntity revert(Location location) {
    return LocationEntity(
      id: location.id,
      title: location.title,
      description: location.description,
      address: location.address,
      lat: location.lat,
      lng: location.lng,
      rating: location.rating,
      imageUrl: location.imageUrl,
      isFavorite: location.isFavorite,
    );
  }
}