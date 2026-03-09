import 'package:edu_manager_provider/models/students_class.dart';
import 'package:flutter/material.dart';

class StudentController extends ChangeNotifier {
  List<StudentsClass> students = [];
  List<StudentsClass> filterStudents = [];
  String searchQuery = '';
  void addStudents(StudentsClass student) {
    students.add(student);
    notifyListeners();
  }

  void deleteStudentsProfile(int index) {
    students.removeAt(index);
    notifyListeners();
  }

  StudentsClass fetchData(int index) {
    return students[index];
  }

  void updateStudentsDetails(int index, StudentsClass curStud) {
    students[index] = curStud;
    notifyListeners();
  }

  void searchStudentsDetails(String query) {
    filterStudents.where((child) {
      final name = child.studentsName!.toLowerCase();
      final id = child.studentsId!.toLowerCase();
      final search = searchQuery.toLowerCase();
      return name.contains(search) || id.contains(search);
    }).toList();
    notifyListeners();
  }
}
