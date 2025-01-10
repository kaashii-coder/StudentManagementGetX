import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentregisterapp/common/constans.dart';
import 'package:studentregisterapp/models/student_detail_model.dart';
import 'package:studentregisterapp/screens/student_total_info_screen.dart';

class StudentSearchDelegate extends SearchDelegate {
  final List<StudentModel> students;

  StudentSearchDelegate({required this.students});

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Actions for the AppBar (e.g., clear button)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Leading icon on the AppBar (e.g., back button)
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search delegate
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show search results
    final results = students
        .where((student) =>
            student.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final student = results[index];
        return ListTile(
          title: Text(student.name),
          subtitle: Text(student.batch),
          onTap: () {
            // Handle the action when a student is selected
            close(context, student); // Close search and pass selected student
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions as the user types
    final suggestions = students
        .where((student) =>
            student.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      color: backGroundColors,
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final student = suggestions[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                  child: suggestions[index].photo.isNotEmpty
                      ? Image.file(File(suggestions[index].photo))
                      : Image.asset(
                          'asset/de594ec09881da3fa66d98384a3c72ff.jpg',
                          height: 50,
                          width: 50,
                        )),
            ),
            title: Text(student.name,style: TextStyle(color: Colors.white),),
            subtitle: Text(student.batch,style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.to(StudentTotalInfoScreen(
                  detailObj: suggestions[index])); // Show the results
            },
          );
        },
      ),
    );
  }
}
