import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentregisterapp/Services/database_services.dart';
import 'package:studentregisterapp/common/constans.dart';
import 'package:studentregisterapp/screens/search_students.dart';
import 'package:studentregisterapp/widgets/gridview_widget.dart';

class StudentListingScreen extends StatelessWidget {
  DatabaseController dbController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar( automaticallyImplyLeading: false, centerTitle: true,
            backgroundColor: backGroundColors,
            title: Text(
              '------Students List------',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: StudentSearchDelegate(
                            students: dbController.stdBucket));
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
          ),
          backgroundColor: backGroundColors,
          body: // ListWidget(),
              Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Expanded(child: GridviewWidget()),
              ],
            ),
          )),
    );
  }
}
