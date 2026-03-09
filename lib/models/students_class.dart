import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'students_class.g.dart';
@HiveType(typeId: 0)
class StudentsClass {
  @HiveField(0)
  String? studentsName;
  @HiveField(1)
  String? studentsId;
  @HiveField(2)
  String? studentsGrade;
  @HiveField(3)
  String? studentsTeacherName;
  @HiveField(4)
  int? parentPhoneNumber;
  @HiveField(5)
  Uint8List? image;
  StudentsClass(
      {this.studentsName,
      this.studentsId,
      this.studentsGrade,
      this.studentsTeacherName,
      this.parentPhoneNumber,
      this.image});
}
