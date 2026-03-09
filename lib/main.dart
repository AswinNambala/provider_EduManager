import 'package:edu_manager_provider/controller/student_controller.dart';
import 'package:edu_manager_provider/models/students_class.dart';
import 'package:edu_manager_provider/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentsClassAdapter());
  await Hive.openBox<StudentsClass>('students_Box');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => StudentController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
