import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pou/screen/frist.dart';

late AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();

    _assetsAudioPlayer.open(
      Audio("assets/audios/main_music.mp3"),
      loopMode: LoopMode.single, //반복 여부 (LoopMode.none : 없음)
      autoStart: true, //자동 시작 여부
      showNotification: false, //스마트폰 알림 창에 띄울지 여부
    );

    _assetsAudioPlayer.play(); //재생
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _assetsAudioPlayer.stop(); //정지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            // opacity: 30.0,
            image: AssetImage('assets/main_back.jpg'), // 배경 이미지
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            InkWell(
              onTap: () {
                _assetsAudioPlayer.stop(); //정지
                Get.to(const First());
              },
              child: Container(
                height: 80.h,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.553),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  '게임 시작',
                  style: TextStyle(
                    fontSize: 35.sp,
                    color: const Color.fromRGBO(255, 92, 146, 1),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
