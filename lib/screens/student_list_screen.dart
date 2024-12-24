import 'package:flutter/material.dart';
import 'package:studentregisterapp/common/constans.dart';
import 'package:studentregisterapp/widgets/gridview_widget.dart';

class StudentListingScreen extends StatelessWidget {
  const StudentListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backGroundColors,
          body: // ListWidget(),
              Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 240, 239, 239),
                    filled: true,
                    hintText: 'Search by names',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 60, 58, 58)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 111, 229, 255),
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 0, 0),
                        width: 2.0,
                      ),
                    ),
                    focusColor: Colors.blue,
                  ),
                ),
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
