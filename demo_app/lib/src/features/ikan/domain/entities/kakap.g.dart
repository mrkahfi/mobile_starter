// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakap.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KakapAdapter extends TypeAdapter<Kakap> {
  @override
  final int typeId = 1;

  @override
  Kakap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Kakap(
      id: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Kakap obj) {
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
      other is KakapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
