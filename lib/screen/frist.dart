import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pou/screen/story1.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundcolor: const Color.fromRGBO(255, 92, 146, 30),
      backgroundColor: const Color.fromRGBO(255, 92, 146, 30),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '친구에게 나캠든을 소개 받은 당신.',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '호감도 100을 만들어서 꼬셔라!',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30.h),
            InkWell(
              onTap: () {
                Get.to(const Story1());
              },
              child: Text(
                'Next',
                style: TextStyle(
                  color: Color.fromARGB(216, 255, 255, 255),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
