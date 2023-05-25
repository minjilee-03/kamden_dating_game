import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pou/widget/score_dialog.dart';
import 'dart:async';

import 'package:pou/widget/widget.dart';

import 'frist_chat_answer.dart';

class FristChat extends StatefulWidget {
  @override
  _FristChatState createState() => _FristChatState();
}

class _FristChatState extends State<FristChat> {
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
                      '안녕하세요!',
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
                      'ㅇㅇ씨 맞으실까요??',
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
                              title: '사람 이름이 어떻게 나캠든',
                              onTap: () async {
                                setState(() {
                                  showDialog = !showDialog;
                                });
                                sendMessage1 = '사람 이름이 어떻게 나캠든';
                                Get.dialog(ScoreDialog(
                                  score: 0,
                                  onDone: () {
                                    Get.to(FristChatAnswer(
                                      answer: sendMessage1,
                                      score: 0,
                                    ));
                                    setState(() {});
                                  },
                                ));
                              },
                            ),
                            RoutingBtn(
                              title: '안녕하세요!',
                              onTap: () async {
                                setState(() {
                                  showDialog = !showDialog;
                                });
                                sendMessage1 = '안녕하세요!';
                                Get.dialog(
                                  ScoreDialog(
                                    score: 10,
                                    onDone: () {
                                      Get.to(FristChatAnswer(
                                        answer: sendMessage1,
                                        score: 10,
                                      ));
                                      setState(() {});
                                    },
                                  ),
                                );
                              },
                            ),
                            RoutingBtn(
                              title: 'ㅎㅇㅎㅇ',
                              onTap: () async {
                                setState(() {
                                  showDialog = !showDialog;
                                });
                                sendMessage1 = 'ㅎㅇㅎㅇ';
                                await Get.dialog(ScoreDialog(
                                  score: 3,
                                  onDone: () {
                                    Get.to(FristChatAnswer(
                                      answer: sendMessage1,
                                      score: 3,
                                    ));
                                    setState(() {});
                                  },
                                ));
                              },
                            ),
                            RoutingBtn(
                              title: '안녕하시묘\n반갑쌉사리와요',
                              onTap: () async {
                                setState(() {
                                  showDialog = !showDialog;
                                });
                                sendMessage1 = '안녕하시묘\n반갑쌉사리와요';
                                Get.dialog(ScoreDialog(
                                  score: 5,
                                  onDone: () {
                                    Get.to(FristChatAnswer(
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
