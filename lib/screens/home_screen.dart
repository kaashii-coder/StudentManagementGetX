import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:studentregisterapp/screens/register_student_screen.dart';
import 'package:studentregisterapp/screens/student_list_screen.dart';
import 'package:studentregisterapp/widgets/option_button_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () =>Get.to(()=> StudentRegisterScreen()) ,
                  child: OptionButtonIcon(
                    register: true,
                  ),
                ),
                GestureDetector(
                  onTap: () =>Get.to(()=>StudentListingScreen()),
                  child: OptionButtonIcon(
                    register: false,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}
