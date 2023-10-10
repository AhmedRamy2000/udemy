import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector iconWidget(String iconName,) {
    //void Function()? onTap
    return GestureDetector(
                    onTap: (){},
                    child: SizedBox(
                      width: 40.w,
                      height: 40.w,
                      child: Image.asset("assets/icons/$iconName.png"),
                    ));
  }