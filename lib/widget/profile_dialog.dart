import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/config.dart';

class ProfileDialog extends StatefulWidget {
  const ProfileDialog({super.key, required this.ontap});
  final Function() ontap;
  @override
  State<ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  Config config = Config();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            widget.ontap();
          },
          child: Container(
            width: 337.w,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            child: Image.asset('assets/nakamden_big_profile.jpeg'),
          ),
        ),
      ),
    );
  }
}
