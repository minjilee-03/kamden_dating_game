import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pou/screen/place_choice.dart';

late AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

class Story3 extends StatefulWidget {
  const Story3({super.key});

  @override
  State<Story3> createState() => _Story3State();
}

class _Story3State extends State<Story3> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            // opacity: 30.0,
            image: AssetImage('assets/home.jpg'), // 배경 이미지
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '어느정도 서로의 대해 대화를 나눈 두 사람.',
              style: TextStyle(
                color: Color.fromARGB(216, 255, 255, 255),
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '첫 약속 장소를 잡으려고 한다.',
              style: TextStyle(
                color: Color.fromARGB(216, 255, 255, 255),
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30.h),
            InkWell(
              onTap: () {
                Get.to(PlaceChoice());
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
