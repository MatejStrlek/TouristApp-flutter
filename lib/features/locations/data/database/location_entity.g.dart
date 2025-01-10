// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationEntityAdapter extends TypeAdapter<LocationEntity> {
  @override
  final int typeId = 1;

  @override
  LocationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationEntity(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      address: fields[3] as String,
      lat: fields[4] as double,
      lng: fields[5] as double,
      rating: fields[6] as int,
      imageUrl: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocationEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.lat)
      ..writeByte(5)
      ..write(obj.lng)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
