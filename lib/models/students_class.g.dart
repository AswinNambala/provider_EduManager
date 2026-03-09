// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentsClassAdapter extends TypeAdapter<StudentsClass> {
  @override
  final int typeId = 0;

  @override
  StudentsClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentsClass(
      studentsName: fields[0] as String?,
      studentsId: fields[1] as String?,
      studentsGrade: fields[2] as String?,
      studentsTeacherName: fields[3] as String?,
      parentPhoneNumber: fields[4] as int?,
      image: fields[5] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentsClass obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.studentsName)
      ..writeByte(1)
      ..write(obj.studentsId)
      ..writeByte(2)
      ..write(obj.studentsGrade)
      ..writeByte(3)
      ..write(obj.studentsTeacherName)
      ..writeByte(4)
      ..write(obj.parentPhoneNumber)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentsClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
