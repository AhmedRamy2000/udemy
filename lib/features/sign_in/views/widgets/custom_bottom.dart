import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/common/values/colors.dart';

class CustomBotton extends StatelessWidget {
  final String bottonName;
  final Color color, textColor;
  final void Function()? onTap;
  const CustomBotton(
      {super.key,
      required this.bottonName,
      this.color = AppColors.primaryElement,
      this.textColor = AppColors.primaryBackground,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 325.w,
          height: 50.h,
          margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 30.h),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15.w),
              border: Border.all(
                  // check for registration button border color
                  color: bottonName == 'Log In'
                      ? Colors.transparent
                      : AppColors.primaryFourElementText),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    color: AppColors.primaryFourElementText)
              ]),
          child: Center(
            child: Text(
              bottonName,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: textColor),
            ),
          )),
    );
  }
}
