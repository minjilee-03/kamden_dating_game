import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

import 'screen/screens.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 667),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) => const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kam',
        home: StartScreen(),
      ),
    );
  }
}
