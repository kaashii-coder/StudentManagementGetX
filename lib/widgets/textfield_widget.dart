import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
   TextFieldWidget({
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Color.fromARGB(255, 210, 208, 208),
        filled: true,
        hintText: 'Typing...$hintText',
        hintStyle: const TextStyle(color: Color.fromARGB(255, 60, 58, 58)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
    );
  }
}
