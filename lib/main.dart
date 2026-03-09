import 'package:edu_manager_provider/controller/student_controller.dart';
import 'package:edu_manager_provider/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => StudentController()),
  ],
  child:const MyApp(),);
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
