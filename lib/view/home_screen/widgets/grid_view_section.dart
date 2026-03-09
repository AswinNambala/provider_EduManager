import 'package:edu_manager_provider/controller/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewSection extends StatefulWidget {
  const GridViewSection({super.key});
  @override
  State<GridViewSection> createState() => _GridViewSectionState();
}

class _GridViewSectionState extends State<GridViewSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentController>(builder: (context, stud, index) {
      final studentsList = stud.students;
      if (studentsList.isEmpty) {
        return const Center(
          child: Text('No Students Details Available'),
        );
      }
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7,
          ),
          itemCount: studentsList.length,
          itemBuilder: (context, index) {
            final data = studentsList[index];
            return InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 0.5),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    data.image != null
                        ? Container(
                            height: 140,
                            width: 160,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.memory(
                                data.image!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 60,
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        data.studentsName!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        data.studentsGrade!,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        data.studentsId!,
                        style: const TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    });
  }
}
