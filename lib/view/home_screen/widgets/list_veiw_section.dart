import 'package:edu_manager_provider/controller/student_controller.dart';
import 'package:edu_manager_provider/view/profile_page.dart';
import 'package:edu_manager_provider/widget/delete_warning.dart';
import 'package:edu_manager_provider/widget/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewSection extends StatefulWidget {
  const ListViewSection({super.key});
  @override
  State<ListViewSection> createState() => _ListViewSectionState();
}

class _ListViewSectionState extends State<ListViewSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentController>(builder: (context, stud, index) {
      final studentsList = stud.students;
      if (studentsList.isEmpty) {
        return const Center(
          child: Text('No Students Details Available'),
        );
      }
      return ListView.builder(
        itemBuilder: (context, index) {
          final data = studentsList[index];
          return Card(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                navigatePush(
                    context, ProfilePage(index: index, studentsData: data));
              },
              child: ListTile(
                leading: data.image != null
                    ? CircleAvatar(
                        radius: 30,
                        backgroundImage: MemoryImage(data.image!),
                      )
                    : const CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person),
                      ),
                title: Text(data.studentsName ?? 'Unknown'),
                subtitle: Text(data.studentsId ?? 'Unknown'),
                trailing: IconButton(
                    onPressed: () {
                      navigatePush(context, DeleteWarning(index: index));
                    },
                    icon: const Icon(Icons.delete)),
              ),
            ),
          );
        },
        itemCount: studentsList.length,
      );
    });
  }
}
