import 'package:flutter_application_1/modules/preferences.dart';
import 'package:flutter_application_1/pages/time.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PreferenceAdapter extends TypeAdapter<Preference> {
  @override
  final int typeId = 2;

  @override
  Preference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Preference(
      darkMode: fields[0],
      armyTime: fields[1],
    );
  }

  @override
  void write(BinaryWriter writer, Preference obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.darkMode)
      ..writeByte(1)
      ..write(obj.armyTime);
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
