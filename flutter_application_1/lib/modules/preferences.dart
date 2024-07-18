import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class Preference extends HiveObject {
  Preference({
    this.darkMode = false,
    this.armyTime = true,
  });

  @HiveField(0)
  bool darkMode;
  @HiveField(1)
  bool armyTime;
}