import 'package:hive_flutter/adapters.dart';
part 'student_detail_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String batch;
  @HiveField(2)
  String address;
  @HiveField(3)
  String photo;
  @HiveField(4)
  String domain;

  StudentModel({
    required this.photo,
    required this.address,
    required this.batch,
    required this.name,
    required this.domain,
  });
}
