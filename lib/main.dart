import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentregisterapp/models/student_detail_model.dart';
import 'package:studentregisterapp/screens/home_screen.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized(); 
   await Hive.initFlutter();
    Hive.registerAdapter(StudentModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //!getX noted
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
