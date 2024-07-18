// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeAdapter extends TypeAdapter<SelectedTimezone> {
  @override
  final int typeId = 1;

  @override
  SelectedTimezone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return SelectedTimezone(
      offset: fields[0],
      mainCity: fields[1],
      code: fields[2],
    );
  }

  @override
  void write(BinaryWriter writer, SelectedTimezone obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.offset)
      ..writeByte(1)
      ..write(obj.mainCity)
      ..writeByte(2)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
