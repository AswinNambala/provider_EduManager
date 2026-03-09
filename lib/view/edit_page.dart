import 'dart:io';
import 'package:edu_manager_provider/constant/utils.dart';
import 'package:edu_manager_provider/controller/student_controller.dart';
import 'package:edu_manager_provider/models/students_class.dart';
import 'package:edu_manager_provider/widget/form_felid.dart';
import 'package:edu_manager_provider/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditStudentsProfile extends StatefulWidget {
  const EditStudentsProfile({super.key, required this.index});
  final int index;

  @override
  State<EditStudentsProfile> createState() => _EditStudentsProfileState();
}

class _EditStudentsProfileState extends State<EditStudentsProfile> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController idCtrl = TextEditingController();
  final TextEditingController teacherCtrl = TextEditingController();
  final TextEditingController gradeCtrl = TextEditingController();
  final TextEditingController parentPhoneNumberCtrl = TextEditingController();

  File? imagefile;
  StudentsClass? student;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    student = Provider.of<StudentController>(context, listen: false)
        .fetchData(widget.index);
    nameCtrl.text = student!.studentsName ?? '';
    idCtrl.text = student!.studentsId ?? '';
    teacherCtrl.text = student!.studentsTeacherName ?? '';
    gradeCtrl.text = student!.studentsGrade ?? '';
    parentPhoneNumberCtrl.text = student!.parentPhoneNumber?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Edit Student Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: buildProfileImage(),
            ),
            const SizedBox(height: 30),
            AllTextFormField(
              controller: nameCtrl,
              preffixIcon: const Icon(
                Icons.person,
                size: 20,
              ),
              hint: 'Enter Students Name',
              label: 'Students Name',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is empty';
                } else if (value.isNotEmpty) {
                  if (value.length < 3) {
                    return 'minimum of 3 letter is neccesary';
                  }
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            AllTextFormField(
              controller: idCtrl,
              preffixIcon: const Icon(
                Icons.contact_mail_sharp,
                size: 20,
              ),
              hint: 'STU-2026-15',
              label: 'Students ID Number',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is empty';
                } else if (value.length < 9) {
                  return 'Students ID length should be more than 9 character';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            AllTextFormField(
              controller: gradeCtrl,
              preffixIcon: const Icon(
                Icons.school,
                size: 20,
              ),
              hint: 'Enter Students Grade',
              label: 'Students Grade',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is empty';
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            AllTextFormField(
              controller: teacherCtrl,
              preffixIcon: const Icon(
                Icons.person,
                size: 20,
              ),
              hint: 'Enter Students Class Teacher Name',
              label: 'Class Teacher Name',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is empty';
                } else if (value.isNotEmpty) {
                  if (value.length < 3) {
                    return 'minimum of 3 letter is neccesary';
                  }
                }

                return null;
              },
            ),
            const SizedBox(height: 15),
            AllTextFormField(
              controller: parentPhoneNumberCtrl,
              preffixIcon: const Icon(
                Icons.phone,
                size: 20,
              ),
              hint: 'Enter Parents Phone Number',
              label: 'Phone Number',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is empty';
                } else if (int.tryParse(value) == null) {
                  return 'Only numbers are accepted';
                } else if (value.length != 10) {
                  return 'Phone number must be 10 digits';
                }

                return null;
              },
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: screenWidth,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  fixedSize: const Size(150, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: updateStudent,
                child: const Text('Update Student',
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
            ),
           const SizedBox(height: 10,),
            SizedBox(
              width: screenWidth,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(150, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel',
                    style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imagefile = File(pickedImage.path);
      });
    }
  }

  Future<void> updateStudent() async {
    if (nameCtrl.text.isEmpty ||
        idCtrl.text.isEmpty ||
        gradeCtrl.text.isEmpty ||
        teacherCtrl.text.isEmpty ||
        parentPhoneNumberCtrl.text.isEmpty) {
      showGlassSnackBar(
          context, 'Fill all felid', 'Recheck any felid is empty');
      return;
    }
    final updatedStudent = StudentsClass(
      studentsName: nameCtrl.text,
      studentsId: idCtrl.text,
      studentsTeacherName: teacherCtrl.text,
      studentsGrade: gradeCtrl.text,
      parentPhoneNumber: int.tryParse(parentPhoneNumberCtrl.text),
      image:
          imagefile != null ? await imagefile!.readAsBytes() : student?.image,
    );

    if (mounted) {
      Provider.of<StudentController>(context)
          .updateStudentsDetails(widget.index, updatedStudent);
      Navigator.pop(context);
      showGlassSnackBar(context, 'Profile Updated',
          "The student details were updated successfully.");
    }
  }

  Widget buildProfileImage() {
    if (imagefile != null) {
      return Container(
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
          backgroundImage: FileImage(imagefile!),
        ),
      );
    } else if (student?.image != null) {
      return Container(
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
          backgroundImage: MemoryImage(student!.image!),
        ),
      );
    } else {
      return Container(
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
      );
    }
  }
  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
    idCtrl.dispose();
    gradeCtrl.dispose();
    parentPhoneNumberCtrl.dispose();
    teacherCtrl.dispose();
    imagefile = null;
  }
}
