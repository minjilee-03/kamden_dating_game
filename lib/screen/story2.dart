import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'frist_chat.dart';

late AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

class Story2 extends StatefulWidget {
  const Story2({super.key});

  @override
  State<Story2> createState() => _Story2State();
}

class _Story2State extends State<Story2> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Get.to(const Story2());
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
