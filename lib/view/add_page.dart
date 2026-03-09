import 'dart:developer';
import 'dart:io';
import 'package:edu_manager_provider/constant/utils.dart';
import 'package:edu_manager_provider/controller/student_controller.dart';
import 'package:edu_manager_provider/models/students_class.dart';
import 'package:edu_manager_provider/view/home_screen/home_page.dart';
import 'package:edu_manager_provider/widget/form_felid.dart';
import 'package:edu_manager_provider/widget/navigation.dart';
import 'package:edu_manager_provider/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController idCtrl = TextEditingController();
  final TextEditingController gradeCtrl = TextEditingController();
  final TextEditingController teacherCtrl = TextEditingController();
  final TextEditingController parentPhoneNumberCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkClearValidate = true;
  final _imagepicker = ImagePicker();
  File? imagefile;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigatePushReplacement(context, const HomePage());
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 30,
            )),
        title: const Text(
          'Add Students',
          style: TextStyle(
              color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 110,
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Students Information',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Fill in the details below to create a new students record',
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.white54,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      await pickImage();
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        imagefile == null
                            ? const Icon(
                                Icons.person,
                                size: 90.0,
                                color: Colors.black54,
                              )
                            : ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                child: Image.file(
                                  imagefile!,
                                  fit: BoxFit.cover,
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.3,
                                ),
                              ),
                        if (imagefile != null)
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  imagefile = null;
                                });
                              },
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.close,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AllTextFormField(
                  controller: nameCtrl,
                  preffixIcon: const Icon(
                    Icons.person,
                    size: 20,
                  ),
                  hint: 'Enter Students Name',
                  label: 'Students Name',
                  validator: (value) {
                    if (checkClearValidate) {
                      if (value!.isEmpty) {
                        return 'Field is empty';
                      } else if (value.isNotEmpty) {
                        if (value.length < 3) {
                          return 'minimum of 3 letter is neccesary';
                        }
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                AllTextFormField(
                  controller: idCtrl,
                  preffixIcon: const Icon(
                    Icons.contact_mail_sharp,
                    size: 20,
                  ),
                  hint: 'STU-2026-15',
                  label: 'Students ID Number',
                  validator: (value) {
                    if (checkClearValidate) {
                      if (value!.isEmpty) {
                        return 'Field is empty';
                      } else if (value.length < 9) {
                        return 'Students ID length should be more than 9 character';
                      }
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                AllTextFormField(
                  controller: gradeCtrl,
                  preffixIcon: const Icon(
                    Icons.school,
                    size: 20,
                  ),
                  hint: 'Enter Students Grade',
                  label: 'Students Grade',
                  validator: (value) {
                    if (checkClearValidate) {
                      if (value!.isEmpty) {
                        return 'Field is empty';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                AllTextFormField(
                  controller: teacherCtrl,
                  preffixIcon: const Icon(
                    Icons.person,
                    size: 20,
                  ),
                  hint: 'Enter Students Class Teacher Name',
                  label: 'Class Teacher Name',
                  validator: (value) {
                    if (checkClearValidate) {
                      if (value!.isEmpty) {
                        return 'Field is empty';
                      } else if (value.isNotEmpty) {
                        if (value.length < 3) {
                          return 'minimum of 3 letter is neccesary';
                        }
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                AllTextFormField(
                  controller: parentPhoneNumberCtrl,
                  preffixIcon: const Icon(
                    Icons.phone,
                    size: 20,
                  ),
                  hint: 'Enter Parents Phone Number',
                  label: 'Phone Number',
                  validator: (value) {
                    if (checkClearValidate) {
                      if (value!.isEmpty) {
                        return 'Field is empty';
                      } else if (int.tryParse(value) == null) {
                        return 'Only numbers are accepted';
                      } else if (value.length != 10) {
                        return 'Phone number must be 10 digits';
                      }
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: savedStudentsDetails,
                  child: Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent[400],
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
                        'Save Student',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: clearDetails,
                  child: Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                        'Clear',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void savedStudentsDetails() async {
    if (nameCtrl.text.isEmpty ||
        idCtrl.text.isEmpty ||
        gradeCtrl.text.isEmpty ||
        teacherCtrl.text.isEmpty ||
        parentPhoneNumberCtrl.text.isEmpty) {
      showGlassSnackBar(
          context, 'Fill all felid', 'Recheck any felid is empty');
      return;
    }
    var student = StudentsClass(
      studentsName: nameCtrl.text,
      studentsId: idCtrl.text,
      studentsGrade: gradeCtrl.text,
      studentsTeacherName: teacherCtrl.text,
      parentPhoneNumber: int.parse(parentPhoneNumberCtrl.text),
      image: imagefile != null ? await imagefile!.readAsBytes() : null,
    );
    if (mounted) {
      Provider.of<StudentController>(context, listen: false)
          .addStudents(student);
      navigatePushReplacement(context, const HomePage());
      showGlassSnackBar(
          context, 'Successfully Created', 'New Students details is created');
    }
  }

  void clearDetails() {
    formKey.currentState!.reset();
    setState(() {
      checkClearValidate = false;
    });
    nameCtrl.clear();
    idCtrl.clear();
    gradeCtrl.clear();
    teacherCtrl.clear();
    parentPhoneNumberCtrl.clear();
    imagefile = null;
    navigatePushReplacement(context, const HomePage());
  }

  Future<void> pickImage({bool resize = false}) async {
    try {
      final XFile? image = await _imagepicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: resize ? 60 : null,
        maxWidth: resize ? 60 : null,
      );

      if (image != null) {
        log('Selected Image Path: ${image.path}');
        setState(() {
          imagefile = File(image.path);
        });
        if (!imagefile!.existsSync()) {
          log('Error: Image file does not exist at path: ${image.path}');
        }
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }
}
