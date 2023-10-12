
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/common/values/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.topMargin=1
  });
  final double topMargin;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 5.h,top:topMargin.h),
        child: Text(
          text,
          style: TextStyle(
              color: AppColors.primaryThreeElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ));
  }
}