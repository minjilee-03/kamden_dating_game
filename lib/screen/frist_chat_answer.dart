import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pou/screen/story2.dart';
import 'package:pou/widget/score_dialog.dart';
import 'dart:async';

import 'package:pou/widget/widget.dart';

import '../config/config.dart';
import '../widget/profile_dialog.dart';

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
      hisAnswer = "ㅎㅎ....";
      meAnswer = "뭐야 답장 왜 이래";
    } else if (widget.score >= 10) {
      hisAnswer = "안뇽하세요!!ㅎㅎ";
      meAnswer = "뭐야 좀 귀엽네?";
    } else if (widget.score == 3) {
      hisAnswer = "안녕하세요..";
      meAnswer = "흠...";
    } else if (widget.score == 5) {
      hisAnswer = "안녕하세요!";
      meAnswer = "오...";
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
                      '근데 내가 지금 연애할 때가 맞나?',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                AnimatedOpacity(
                  opacity: _currentIndex >= 5 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 800),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '좀 귀찮네...',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                AnimatedOpacity(
                  opacity: _currentIndex >= 6 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 900),
                  onEnd: () {
                    setState(() {
                      showDialog = !showDialog;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '음? 프로필 사진? 구경해볼까?',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                showDialog
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: RoutingBtn(
                          title: '예',
                          onTap: () async {
                            setState(() {
                              showDialog = !showDialog;
                            });
                            await Get.dialog(ProfileDialog(
                              ontap: () {
                                Get.back();
                                setState(() {
                                  start = !start;
                                });
                              },
                            ));
                          },
                        ),
                      )
                    : const SizedBox(),
                start
                    ? AnimatedOpacity(
                        opacity: _currentIndex >= 6 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 900),
                        onEnd: () {
                          setState(() {
                            showDialog = !showDialog;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '............',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),
                      )
                    : SizedBox(),
                start
                    ? AnimatedOpacity(
                        opacity: _currentIndex >= 7 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 900),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '널 무조건 내 남자로 만들겠어.',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),
                      )
                    : SizedBox(),
                start
                    ? AnimatedOpacity(
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
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
