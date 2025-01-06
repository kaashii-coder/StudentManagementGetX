

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentregisterapp/Services/database_services.dart';
import 'package:studentregisterapp/Services/student_reg_controller.dart';
import 'package:studentregisterapp/common/constans.dart';

import 'package:studentregisterapp/models/student_detail_model.dart';

class EditStudentDetailsScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final int studentKey; // Key to identify the student in the database
  final StudentModel student; // Student data to prefill the form

  final StudentRegisterController editDetailsController = Get.put(StudentRegisterController());
  final DatabaseController dbController = Get.put(DatabaseController());

  EditStudentDetailsScreen({required this.studentKey, required this.student, Key? key})
      : super(key: key) {
    nameController.text = student.name;
    batchController.text = student.batch;
    addressController.text = student.address;
    skillController.text = student.domain;
    editDetailsController.imagePath.value = student.photo;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColors,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Update Details',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        editDetailsController.pickImage(ImageSource.gallery);
                      },
                      child: Obx(
                        () => Container(
                          color: Colors.white,
                          width: 150,
                          height: 150,
                          child: editDetailsController.imagePath.isEmpty
                              ? Image.asset(
                                  'asset/208995.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(editDetailsController.imagePath.value),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  buildTextFormField(nameController, 'Typing...Name', 'Name cannot be empty'),
                  const SizedBox(height: 22),
                  buildTextFormField(batchController, 'Typing...Batch', 'Batch cannot be empty'),
                  const SizedBox(height: 22),
                  buildTextFormField(addressController, 'Typing...Address', 'Address cannot be empty'),
                  const SizedBox(height: 22),
                  buildTextFormField(skillController, 'Typing...Skill', 'Skill cannot be empty'),
                  const SizedBox(height: 22),
                  ElevatedButton(
                    onPressed: () {
                      submitButtonFunction();
                      Get.back();
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      TextEditingController controller, String hintText, String errorText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 210, 208, 208),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 60, 58, 58)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 111, 229, 255),
            width: 2.0,
          ),
        ),
        focusColor: Colors.blue,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }

  void submitButtonFunction() {
    if (formKey.currentState!.validate()) {
      final updatedStudent = StudentModel(
        photo: editDetailsController.imagePath.value,
        address: addressController.text,
        batch: batchController.text,
        name: nameController.text,
        domain: skillController.text,
      );
      dbController.updateStudent(studentKey, updatedStudent);
      log('Student updated: ${updatedStudent.toString()}');
    } else {
      Get.snackbar('Error', 'Complete all fields');
    }
  }
}
