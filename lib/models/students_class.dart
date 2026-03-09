import 'dart:typed_data';

class StudentsClass {
  String? studentsName;
  String? studentsId;
  String? studentsGrade;
  String? studentsTeacherName;
  int? parentPhoneNumber;
  Uint8List? image;
  StudentsClass(
      {this.studentsName,
      this.studentsId,
      this.studentsGrade,
      this.studentsTeacherName,
      this.parentPhoneNumber,
      this.image});
}
