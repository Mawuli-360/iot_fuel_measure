import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Box extends StatelessWidget {
  const Box(
      {super.key,
      required this.title,
      required this.data,
      required this.height,
      required this.width});
  final String title;
  final String data;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFFF9FAFF),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(62, 0, 0, 0),
              offset: Offset(0, 2),
              blurRadius: 5,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: GoogleFonts.prompt(
                  color: const Color(0xff03C988),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600)),
          Text(data,
              style: GoogleFonts.prompt(
                color: const Color(0xff03C988),
                fontSize: 12.sp,
              ))
        ],
      ),
    );
  }
}
