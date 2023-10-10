import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/common/values/colors.dart';
import 'package:udemy/features/sign_in/views/widgets/custom_app_bar.dart';
import 'package:udemy/features/sign_in/views/widgets/custom_bottom.dart';
import 'package:udemy/features/sign_in/views/widgets/custom_text.dart';
import 'package:udemy/features/sign_in/views/widgets/custom_text_field.dart';
import 'package:udemy/features/sign_in/views/widgets/icon_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: customAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      iconWidget("google"),
                      iconWidget("apple"),
                      iconWidget("facebook"),
                    ]),
              ),
              const CustomText(text: "Or use your email account to login"),
              const CustomTextField(
                text: 'Email',
                icon: 'user',
                hint: 'Enter your email address',
                topMargin: 66,
              ),
              const CustomTextField(
                text: 'Password',
                icon: 'lock',
                hint: 'Enter your password',
                topMargin: 20,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.primaryText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  )),
              CustomBotton(
                onTap: () {},
                bottonName: 'Log In',
              ),
              CustomBotton(
                onTap: () {},
                bottonName: 'Register',
                color: AppColors.primaryBackground,
                textColor: AppColors.primaryText,
              )
            ],
          ),
        ),
      )),
    );
  }
}

