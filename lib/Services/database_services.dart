import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentregisterapp/models/student_detail_model.dart';

class DatabaseController extends GetxController {
  var stdBucket = <StudentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllSTD(); 
    log('DatabaseController initialized, fetching all students');
  }

  Future addDataIntoDB(StudentModel stdModel) async {
    var box = await Hive.openBox<StudentModel>("StudentManagementDB");
    await box.add(stdModel);
    log('Data added: ${stdModel.toString()}');
    getAllSTD();
  }

  Future getAllSTD() async {
    var box = await Hive.openBox<StudentModel>("StudentManagementDB");
    stdBucket.assignAll(box.values.toList());
    log(stdBucket.length.toString());
  }

  Future<void> deleteStudent(int index) async {
    var box = await Hive.openBox<StudentModel>("StudentManagementDB");
    await box.deleteAt(index);
    log('Student deleted at index $index');
    getAllSTD();
  }

  Future<void> updateStudent(int key, StudentModel studentModel) async {
    var box = await Hive.openBox<StudentModel>("StudentManagementDB");
   await    box.put(key, studentModel);
    await getAllSTD();
  }
}
