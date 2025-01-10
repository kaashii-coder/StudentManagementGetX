import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentregisterapp/Services/database_services.dart';
import 'package:studentregisterapp/common/constans.dart';
import 'package:studentregisterapp/Services/student_reg_controller.dart';
import 'package:studentregisterapp/models/student_detail_model.dart';


class StudentRegisterScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController photoController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  StudentRegisterController regController =
      Get.put(StudentRegisterController());
  DatabaseController dbController = Get.put(DatabaseController());
  XFile? _image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backGroundColors,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Register Details',
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
                    SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GestureDetector(
                        onTap: () {
                          regController.pickImage(ImageSource.gallery);
                        },
                        child: Obx(
                          () => Container(
                              color: Colors.white,
                              width: 150,
                              height: 150,
                              child: regController.imagePath.isEmpty
                                  ? Image.asset(
                                      'asset/208995.png',
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(regController.imagePath.value),
                                      fit: BoxFit.cover,
                                    )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 210, 208, 208),
                        filled: true,
                        hintText: 'Type...Name',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 60, 58, 58)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
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
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: batchController,
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 210, 208, 208),
                        filled: true,
                        hintText: 'Type...Batch',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 60, 58, 58)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
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
                          return 'Batch cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 210, 208, 208),
                        filled: true,
                        hintText: 'Type...Address',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 60, 58, 58)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
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
                          return 'Address cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: skillController,
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 210, 208, 208),
                        filled: true,
                        hintText: 'Type...Skill',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 60, 58, 58)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
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
                          return 'Skill cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          submitButtonFuction();
                          Get.back();
                        },
                        child: Text('Submit',style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)))),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  submitButtonFuction() {
    if (formKey.currentState!.validate()) {
      final carrierObj = StudentModel(
          photo: regController.imagePath.value,
          address: addressController.text,
          batch: batchController.text,
          name: nameController.text,
          domain: skillController.text);

      dbController.addDataIntoDB(carrierObj);
    } else {
      Get.snackbar('error', 'complete the all fields');
    }
  }
}
