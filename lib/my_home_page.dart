import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:measure/box.dart';
import 'package:measure/box2.dart';
import 'package:sizer/sizer.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseReference _databaseReference;
  String volume = '';
  String totalAmtVolumeLeft = "";
  double data = 0;
  double percentValue = 0.0;
  double percentage = 0;
  String per = "";

  @override
  void initState() {
    super.initState();
    _databaseReference =
        FirebaseDatabase.instance.ref().child('/sensorValue/data');
    _databaseReference.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          volume = event.snapshot.value.toString();
          data = 10 * double.parse(volume);
          totalAmtVolumeLeft = data.toStringAsFixed(2);
          percentValue = (double.parse(volume) / 1414) * 1;
          percentage = (double.parse(volume) / 1414) * 100;
          per = percentage.toStringAsFixed(0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 23, 121, 88),
        body: SizedBox(
          height: 100.h,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: 100.h,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                Color(0xff03C988),
                                Color.fromARGB(255, 12, 173, 120),
                                Color.fromARGB(255, 38, 150, 113),
                                Color.fromARGB(255, 25, 167, 120),
                                Color.fromARGB(255, 23, 121, 88),
                              ])),
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    SizedBox(width: 4.w),
                                    const Icon(
                                      Icons.dashboard,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 2.w),
                                    Text("Dashboard",
                                        style: GoogleFonts.prompt(
                                            color: Colors.white,
                                            fontSize: 26.sp,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 3.h),
                                SizedBox(
                                  height: 25.h,
                                  width: 40.h,
                                  child: LiquidCircularProgressIndicator(
                                    value: percentValue, // Defaults to 0.5.
                                    valueColor: const AlwaysStoppedAnimation(
                                        Color.fromARGB(162, 8, 119,
                                            76)), // Defaults to the current Theme's accentColor.
                                    backgroundColor: const Color(
                                        0x4AFDFAFA), // Defaults to the current Theme's backgroundColor.
                                    borderColor: Colors.white,
                                    borderWidth: 5.0,
                                    direction: Axis.vertical,
                                    center: Text(
                                      "$per%",
                                      style: GoogleFonts.bungee(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 34.sp),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Container(
                            color: const Color(0xffe2e3eb),
                          ),
                        ),
                      )
                    ]),
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 2.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.h),
                    child: SizedBox(
                      height: 58.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 10.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF9FAFF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(62, 0, 0, 0),
                                    offset: Offset(0, 2),
                                    blurRadius: 5,
                                  )
                                ]),
                            child: Center(
                              child: Text("RESERVOIR MEASUREMENT SYSTEM",
                                  style: GoogleFonts.prompt(
                                      color: const Color(0xff03C988),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(
                              height: 35.h,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Box2(
                                    data: '$volume LITRES',
                                    height: double.infinity,
                                    img:
                                        'https://cdn-icons-png.flaticon.com/512/3626/3626958.png',
                                    title: 'VOLUME',
                                    width: 40.w,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Box(
                                        data: "1414 Litres",
                                        height: 10.h,
                                        title: 'Total Volume',
                                        width: 45.w,
                                      ),
                                      Box(
                                        data: 'GHC 14,140.00',
                                        height: 10.h,
                                        title: 'Total Amount',
                                        width: 45.w,
                                      ),
                                      Box(
                                        data: 'GHC $totalAmtVolumeLeft',
                                        height: 10.h,
                                        title: 'Total Amount Left',
                                        width: 45.w,
                                      )
                                    ],
                                  )
                                ],
                              )),
                          Container(
                            height: 8.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF9FAFF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(62, 0, 0, 0),
                                    offset: Offset(0, 2),
                                    blurRadius: 5,
                                  )
                                ]),
                            child: Center(
                                child: Text("Notification",
                                    style: GoogleFonts.prompt(
                                        color: const Color(0xff03C988),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
