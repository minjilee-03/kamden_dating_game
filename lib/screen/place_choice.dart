import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pou/screen/place_choice_answer.dart';
import 'package:pou/widget/score_dialog.dart';
import 'dart:async';

import 'package:pou/widget/widget.dart';

import 'frist_chat_answer.dart';

class PlaceChoice extends StatefulWidget {
  @override
  _PlaceChoiceState createState() => _PlaceChoiceState();
}

class _PlaceChoiceState extends State<PlaceChoice> {
  bool showDialog = false;
  int _currentIndex = 0;
  Timer? _timer;
  String sendMessage1 = '';
  bool showMyAnswer = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 400), (timer) {
      setState(() {
        if (_currentIndex < 4) {
          _currentIndex++;
        } else {
          _timer?.cancel();
        }
      });
    });
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
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Container(
                      width: 42.w,
                      height: 42.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/kamden_profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "나캠든",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                AnimatedOpacity(
                  opacity: _currentIndex >= 2 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 90),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 228, 228),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '식사 장소는 어디로 정할까요?',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                AnimatedOpacity(
                  onEnd: () {
                    setState(() {
                      showDialog = !showDialog;
                    });
                  },
                  opacity: _currentIndex >= 3 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 228, 228),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'ㅇㅇ씨는 좋아하시 거 있으세요?',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                showDialog
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            RoutingBtn(
                              title: '혹시 초밥 좋아하세요?',
                              onTap: () async {
                                setState(() {
                                  showDialog = !showDialog;
                                });
                                sendMessage1 = '혹시 초밥 좋아하세요?';
                                Get.dialog(ScoreDialog(
                                  score: 10,
                                  onDone: () {
                                    Get.to(PlaceChoiceAnswer(
                                      answer: sendMessage1,
                                      score: 10,
                                    ));
                                    setState(() {});
                                  },
                                ));
                              },
                            ),
                            RoutingBtn(
                              title: '너',
                              onTap: () async {
                                setState(() {
                                  showDialog = !showDialog;
                                });
                                sendMessage1 = '너';
                                Get.dialog(
                                  ScoreDialog(
                                    score: 3,
                                    onDone: () {
                                      Get.to(PlaceChoiceAnswer(
                                        answer: sendMessage1,
                                        score: 3,
                                      ));
                                      setState(() {});
                                    },
                                  ),
                                );
                              },
                            ),
                            RoutingBtn(
                              title: '캠든씨가 드시고 싶으신걸루 ㅎㅎ',
                              onTap: () async {
                                setState(() {
                                  showDialog = !showDialog;
                                });
                                sendMessage1 = '캠든씨가 드시고 싶으신걸루 ㅎㅎ';
                                await Get.dialog(ScoreDialog(
                                  score: 0,
                                  onDone: () {
                                    Get.to(PlaceChoiceAnswer(
                                      answer: sendMessage1,
                                      score: 0,
                                    ));
                                    setState(() {});
                                  },
                                ));
                              },
                            ),
                            RoutingBtn(
                              title: '초밥 드시죠?',
                              onTap: () async {
                                setState(() {
                                  showDialog = !showDialog;
                                });
                                sendMessage1 = '초밥 드시죠?';
                                Get.dialog(ScoreDialog(
                                  score: 5,
                                  onDone: () {
                                    Get.to(PlaceChoiceAnswer(
                                      answer: sendMessage1,
                                      score: 5,
                                    ));
                                    setState(() {});
                                  },
                                ));
                              },
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
