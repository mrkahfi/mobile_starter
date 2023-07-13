// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantItemAdapter extends TypeAdapter<PlantItem> {
  @override
  final int typeId = 1;

  @override
  PlantItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlantItem(
      id: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PlantItem obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
