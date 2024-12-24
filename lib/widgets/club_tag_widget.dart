import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentregisterapp/models/student_detail_model.dart';

class ClubTagWidget extends StatelessWidget {
   StudentModel detailObj;
   ClubTagWidget({  required this.detailObj,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text(
                'Flutter',
                style: GoogleFonts.roboto(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
