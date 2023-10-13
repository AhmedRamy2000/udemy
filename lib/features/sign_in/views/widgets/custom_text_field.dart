import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/common/values/colors.dart';
import 'package:udemy/features/sign_in/views/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final double topMargin;
  final String text, hint, icon;
  final void Function(String)? onChanged;
  const CustomTextField(
      {super.key,
      required this.topMargin,
      required this.text,
      required this.hint,
      required this.icon,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin.h),
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(children: [
        Align(alignment: Alignment.topLeft, child: CustomText(text: text)),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              border: Border.all(color: AppColors.primaryThreeElementText)),
          child: Row(children: [
            Container(
                margin: EdgeInsets.only(left: 15.w),
                width: 16.w,
                height: 16.h,
                child: Image.asset('assets/icons/$icon.png')),
            SizedBox(
              width: 250.w,
              height: 50.h,
              child: TextField(
                onChanged: (value)=>onChanged!(value),
                  keyboardType: TextInputType.multiline,
                  autocorrect: false,
                  obscureText: text =="Password"||text == "Confirm Password" ? true:false,
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: AppColors.primaryThreeElementText),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.normal,
                      fontSize: 16.sp)),
            )
          ]),
        )
      ]),
    );
  }
}