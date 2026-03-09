import 'package:edu_manager_provider/constant/utils.dart';
import 'package:edu_manager_provider/models/students_class.dart';
import 'package:edu_manager_provider/view/edit_page.dart';
import 'package:edu_manager_provider/widget/delete_warning.dart';
import 'package:edu_manager_provider/widget/navigation.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {super.key, required this.index, required this.studentsData});
  final StudentsClass studentsData;
  final int index;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Students Profile',
            style: TextStyle(
                color: textColor, fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
        child: Center(
          child: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.studentsData.image != null
                    ? Container(
                        height: 190,
                        width: 190,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage:
                              MemoryImage(widget.studentsData.image!),
                        ),
                      )
                    : Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
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
                          size: 70,
                        ),
                      ),
                Text(
                  widget.studentsData.studentsName!,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'STUDENTS INFORMATION',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38),
                    )),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.quick_contacts_mail_outlined,
                      color: Colors.blue[900],
                      size: 25,
                    ),
                  ),
                  subtitle: Text(
                    widget.studentsData.studentsId!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  title: const Text('STUDENTS ID',
                      style: TextStyle(color: Colors.black54)),
                ),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.school_outlined,
                      color: Colors.blue[900],
                      size: 25,
                    ),
                  ),
                  subtitle: Text(
                    widget.studentsData.studentsGrade!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  title: const Text('STUDENTS GRADE',
                      style: TextStyle(color: Colors.black54)),
                ),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Colors.blue[900],
                      size: 25,
                    ),
                  ),
                  subtitle: Text(
                    widget.studentsData.studentsTeacherName!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  title: const Text('CLASSS TEACHER NAME',
                      style: TextStyle(color: Colors.black54)),
                ),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.phone_in_talk_outlined,
                        size: 25, color: Colors.blue[900]),
                  ),
                  subtitle: Text(
                    widget.studentsData.parentPhoneNumber.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  title: const Text(
                    'PARENT PHONE NUMBER',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        navigatePush(
                            context, EditStudentsProfile(index: widget.index));
                      },
                      child: Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            '✏️ Edit Profile',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigatePush(
                            context, DeleteWarning(index: widget.index));
                      },
                      child: Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.redAccent[700],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            '🗑 Delete Profile',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
