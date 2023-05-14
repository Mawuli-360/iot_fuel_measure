import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Box2 extends StatelessWidget {
  const Box2({
    super.key,
    required this.img,
    required this.title,
    required this.data,
    required this.height,
    required this.width,
  });

  final String img;
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
        children: [
          Padding(
            padding: EdgeInsets.all(2.4.h),
            child: Image.network(img),
          ),
          Text(
            title,
            style: GoogleFonts.prompt(
                color: const Color(0xff03C988),
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(data,
              style: GoogleFonts.prompt(
                  color: const Color(0xff03C988), fontSize: 12.sp))
        ],
      ),
    );
  }
}
