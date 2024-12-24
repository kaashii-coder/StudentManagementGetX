import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentregisterapp/Services/database_services.dart';
import 'package:studentregisterapp/screens/student_total_info_screen.dart';

class GridviewWidget extends StatelessWidget {
  DatabaseController dbController = Get.put(DatabaseController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      log('stdBucket length: ${dbController.stdBucket.length}');
      if (dbController.stdBucket.isEmpty) {
        return const Center(
            child: Text('No students found', style: TextStyle(fontSize: 18)));
      } else {
        return SizedBox(
          child: GridView.builder(
              itemCount: dbController.stdBucket.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2.15 / 3),
              itemBuilder: (context, itemIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () => Get.to(() => StudentTotalInfoScreen(
                          detailObj: dbController.stdBucket[itemIndex],
                        )),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: dbController
                                          .stdBucket[itemIndex].photo.isEmpty
                                      ? Image.asset(
                                          'asset/de594ec09881da3fa66d98384a3c72ff.jpg')
                                      : Image.file(
                                          File(dbController
                                              .stdBucket[itemIndex].photo),
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.cover,
                                        )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text("Name: "),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text("Batch: "),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text("Domain: "),
                                    SizedBox(
                                      height: 7,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                        dbController.stdBucket[itemIndex].name),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(dbController
                                        .stdBucket[itemIndex].batch),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(dbController
                                        .stdBucket[itemIndex].domain),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: 'Delete Confirmation',
                                        middleText:
                                            'Are you sure you want to delete this student?',
                                        textCancel: 'Cancel',
                                        textConfirm: 'Delete',
                                        confirmTextColor: Colors.white,
                                        onConfirm: () {
                                          dbController.deleteStudent(itemIndex);
                                          Get.back(); // Close the dialog
                                          Get.showSnackbar(GetSnackBar(duration: Duration(seconds: 3),backgroundColor: Colors.green,borderRadius: 10,
                                            title: 'delete',
                                            message: 'successfully deleted',
                                          ));
                                         
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      }
    });
  }
}
