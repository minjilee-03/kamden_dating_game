import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pou/screen/story2.dart';

import '../widget/profile_dialog.dart';
import '../widget/routing_button.dart';

class PlaceChoiceAnswer extends StatefulWidget {
  const PlaceChoiceAnswer({
    super.key,
    required this.answer,
    required this.score,
  });
  final String answer;
  final int score;

  @override
  _PlaceChoiceAnswerState createState() => _PlaceChoiceAnswerState();
}

class _PlaceChoiceAnswerState extends State<PlaceChoiceAnswer> {
  bool showDialog = false;
  int _currentIndex = 0;
  Timer? _timer;
  String sendMessage1 = '';
  bool showMyAnswer = false;
  bool start = false;
  String hisAnswer = "";
  String meAnswer = "";
  bool done = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
    matchHisAnswer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 900), (timer) {
      setState(() {
        if (_currentIndex < 8) {
          _currentIndex++;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  matchHisAnswer() {
    if (widget.score == 0) {
      hisAnswer = "....";
      meAnswer = "내가 뭐 잘못했나";
    } else if (widget.score >= 10) {
      hisAnswer = "헉 ㅎㅎ 좋아해요!";
      meAnswer = "귀여워...";
    } else if (widget.score == 3) {
      hisAnswer = "아....";
      meAnswer = "음...?";
    } else if (widget.score == 5) {
      hisAnswer = "아 네네!";
      meAnswer = "좋아하는 구나~";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 18.w),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 228, 228),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '식사 장소는 어디로 정할까요?',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 18.w),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 228, 228),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'ㅇㅇ씨는 좋아하시 거 있으세요?',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Spacer(),
                    AnimatedOpacity(
                      opacity: _currentIndex >= 1 ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 18.w),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 81, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          widget.answer,
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                AnimatedOpacity(
                  opacity: _currentIndex >= 2 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 18.w),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 228, 228),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      hisAnswer,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(height: 28.h),
                AnimatedOpacity(
                  opacity: _currentIndex >= 3 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      meAnswer,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                AnimatedOpacity(
                  opacity: _currentIndex >= 4 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 700),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '좋아 이젠 실전이다.',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                AnimatedOpacity(
                    opacity: _currentIndex >= 8 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 900),
                    child: InkWell(
                      onTap: () {
                        Get.to(const Story2());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
