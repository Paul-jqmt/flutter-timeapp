import 'package:hive/hive.dart';
part 'time.g.dart';

@HiveType(typeId: 1)
class SelectedTimezone extends HiveObject {
  SelectedTimezone({
    required this.offset,
    required this.mainCity,
    required this.code,
  });

  @HiveField(0)
  late String? offset;
  @HiveField(1)
  late String? mainCity;
  @HiveField(2)
  late String? code;
}
