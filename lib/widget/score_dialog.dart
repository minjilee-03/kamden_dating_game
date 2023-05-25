import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pou/widget/widget.dart';

import '../config/config.dart';

class ScoreDialog extends StatefulWidget {
  const ScoreDialog({super.key, required this.score, required this.onDone});
  final int score;
  final Function() onDone;
  @override
  State<ScoreDialog> createState() => _ScoreDialogState();
}

class _ScoreDialogState extends State<ScoreDialog> {
  Config config = Config();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 337.w,
          height: 130.h,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '호감도 +${widget.score}',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromRGBO(255, 92, 146, 1),
                ),
              ),
              RoutingBtn(
                title: '확인',
                onTap: () {
                  config.addScore(widget.score);

                  widget.onDone();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
