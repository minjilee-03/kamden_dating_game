import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'frist_chat.dart';

late AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

class Story1 extends StatefulWidget {
  const Story1({super.key});

  @override
  State<Story1> createState() => _Story1State();
}

class _Story1State extends State<Story1> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            // opacity: 30.0,
            image: AssetImage('assets/home.jpg'), // 배경 이미지
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isDone
                ? Text(
                    '친구에게 남자를 소개 받은 당신.\n연락이 오기를 기다리고 있는데....',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox.shrink(),
            isDone ? SizedBox(height: 20.h) : const SizedBox.shrink(),
            isDone
                ? InkWell(
                    onTap: () {
                      _assetsAudioPlayer.stop(); //정지
                      Get.to(FristChat());
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Color.fromARGB(216, 255, 255, 255),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            AnimatedTextKit(
              displayFullTextOnTap: true,
              isRepeatingAnimation: false,
              onFinished: () {
                setState(() {
                  isDone = !isDone;
                });
                _assetsAudioPlayer.open(
                  Audio("assets/audios/phone.mp3"),
                  loopMode: LoopMode.none,
                  autoStart: true, //자동 시작 여부
                  showNotification: false, //스마트폰 알림 창에 띄울지 여부
                );

                _assetsAudioPlayer.stop(); //재생
              },
              animatedTexts: [
                FadeAnimatedText(
                  '친구에게 남자를 소개 받은 당신.\n연락이 오기를 기다리고 있는데....',
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
