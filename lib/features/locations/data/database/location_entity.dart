import 'package:hive_flutter/adapters.dart';

part 'location_entity.g.dart';

@HiveType(typeId: 1)
class LocationEntity extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String address;
  @HiveField(4)
  final double lat;
  @HiveField(5)
  final double lng;
  @HiveField(6)
  final int rating;
  @HiveField(7)
  final String imageUrl;
  @HiveField(8)
  bool isFavorite;

  LocationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.lat,
    required this.lng,
    required this.rating,
    required this.imageUrl,
    this.isFavorite = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is LocationEntity &&
        other.id == id &&
        other.title == title &&
        other.address == address;
  }

  @override
  int get hashCode => Object.hash(id, title, address);
}