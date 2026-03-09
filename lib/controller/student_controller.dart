import 'package:edu_manager_provider/models/students_class.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StudentController extends ChangeNotifier {
  final Box<StudentsClass> studentsBox =
      Hive.box<StudentsClass>('students_Box');
  List<StudentsClass> get students => studentsBox.values.toList();
  String searchQuery = '';
  bool isGridView = false;

  void addStudents(StudentsClass student) {
    studentsBox.add(student);
    notifyListeners();
  }

  void deleteStudentsProfile(int index) {
    studentsBox.deleteAt(index);
    notifyListeners();
  }

  void toggleView() {
    isGridView = !isGridView;
    notifyListeners();
  }

  StudentsClass fetchData(int index) {
    return students[index];
  }

  void updateStudentsDetails(int index, StudentsClass curStud) {
    studentsBox.put(index, curStud);
    notifyListeners();
  }

  void searchStudentsDetails(String query) {
    searchQuery = query;
    notifyListeners();
  }

  List<StudentsClass> getDetails() {
    if (searchQuery.isEmpty) {
      return students;
    } else {
      final search = searchQuery.toLowerCase();
      return students.where((child) {
        final name = child.studentsName!.toLowerCase();
        final id = child.studentsId!.toLowerCase();
        return name.contains(search) || id.contains(search);
      }).toList();
    }
  }
}
