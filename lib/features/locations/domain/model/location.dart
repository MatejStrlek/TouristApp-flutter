import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int id;
  final String title;
  final String description;
  final String address;
  final double lat;
  final double lng;
  final int rating;
  final String imageUrl;
  bool isFavorite;

  Location({
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

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Location &&
        other.id == id &&
        other.title == title &&
        other.address == address;
  }

  @override
  int get hashCode => Object.hash(id, title, address);
}