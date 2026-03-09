import 'package:edu_manager_provider/constant/utils.dart';
import 'package:edu_manager_provider/controller/student_controller.dart';
import 'package:edu_manager_provider/view/add_page.dart';
import 'package:edu_manager_provider/view/home_screen/widgets/grid_view_section.dart';
import 'package:edu_manager_provider/view/home_screen/widgets/header_section.dart';
import 'package:edu_manager_provider/view/home_screen/widgets/list_veiw_section.dart';
import 'package:edu_manager_provider/widget/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          title: const Text(
            "EduManager",
            style: TextStyle(
                color: textColor, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(
                Icons.school_outlined,
                size: 30,
                color: Colors.blue[900],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[100], shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.person_2_outlined,
                    size: 30,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            )
          ],
          backgroundColor: backgroundColor),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          navigatePushReplacement(context, const AddPage());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Consumer<StudentController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                HeaderSection(),
                controller.isGridView
                    ? const Expanded(child: GridViewSection())
                    : const Expanded(child: ListViewSection()),
              ],
            );
          }
        ),
      ),
    );
  }
}
