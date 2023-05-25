import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pou/widget/score_dialog.dart';
import 'dart:async';

import 'package:pou/widget/widget.dart';

import '../config/config.dart';

class FristChatAnswer extends StatefulWidget {
  const FristChatAnswer({
    super.key,
    required this.answer,
    required this.score,
  });
  final String answer;
  final int score;

  @override
  _FristChatAnswerState createState() => _FristChatAnswerState();
}

class _FristChatAnswerState extends State<FristChatAnswer> {
  bool showDialog = false;
  int _currentIndex = 0;
  Timer? _timer;
  String sendMessage1 = '';
  bool showMyAnswer = false;
  String hisAnswer = "";

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
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (_currentIndex < 2) {
          _currentIndex++;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  matchHisAnswer() {
    if (widget.score == 0) {
      return hisAnswer = "ㅎㅎ....";
    } else if (widget.score >= 10) {
      return hisAnswer = "안뇽하세요!!ㅎㅎ";
    } else if (widget.score == 3) {
      return hisAnswer = "안녕하세요..";
    } else if (widget.score == 5) {
      return hisAnswer = "안녕하세요!";
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
                    '안녕하세요',
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
                    'ㅇㅇ씨 맞으실까요??',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
