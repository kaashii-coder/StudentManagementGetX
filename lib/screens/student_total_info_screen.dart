import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentregisterapp/common/constans.dart';
import 'package:studentregisterapp/models/student_detail_model.dart';
import 'package:studentregisterapp/widgets/club_tag_widget.dart';

class StudentTotalInfoScreen extends StatelessWidget {
  StudentModel detailObj;
   StudentTotalInfoScreen({
    required this.detailObj,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColors,
      body: CustomScrollView(
        scrollBehavior: const ScrollBehavior(),
        slivers: [
          SliverAppBar.large(
            leading: Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(top: 8, left: 8),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  )),
            ),
            backgroundColor: backGroundColors,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child:detailObj.photo.isEmpty? Image.asset(
                  'asset/photo_2024-12-19_18-04-19.jpg',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ):Image.file(File(detailObj.photo))
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailObj.name,
                    style: GoogleFonts.openSans(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),

                  Text(
                    detailObj.batch,
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 117, 116, 116)),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Skills',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 248, 245, 245)),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //!May be some error will appear here
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClubTagWidget(detailObj: detailObj),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // ClubTagWidget(detailObj: detailObj),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // ClubTagWidget(detailObj: detailObj),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Address',
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    detailObj.address,
                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 117, 116, 116)),
                  ),
                  // Text(
                  //   "Annassery,Thalakulathoor",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w600,
                  //       color: const Color.fromARGB(255, 117, 116, 116)),
                  // ),
                  // Text(
                  //   "Kozhikode,Pin: 47523987",
                  //   style: GoogleFonts.openSans(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w600,
                  //       color: const Color.fromARGB(255, 117, 116, 116)),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
