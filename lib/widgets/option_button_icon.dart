import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OptionButtonIcon extends StatelessWidget {
  bool register;

  OptionButtonIcon({
    required this.register,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: const Color.fromARGB(255, 0, 0, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 130,
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ SizedBox(
              height: 10,
            ),
              SizedBox(
                width: 70,
                height: 70,
                child:register? Image.asset('asset/plus.gif'):Image.asset('asset/list.gif') ,
              ),SizedBox(height: 10,),
              register ? Text('Register Student') : Text('Students List')
            ],
          ),
        ),
      ),
    );
  }
}
