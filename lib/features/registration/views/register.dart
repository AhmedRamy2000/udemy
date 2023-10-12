import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/common/values/colors.dart';

import 'package:udemy/features/sign_in/views/widgets/custom_app_bar.dart';
import 'package:udemy/features/sign_in/views/widgets/custom_bottom.dart';
import 'package:udemy/features/sign_in/views/widgets/custom_text.dart';
import 'package:udemy/features/sign_in/views/widgets/custom_text_field.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: customAppBar('Sign Up'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomText(text: "Enter your details below & free sign up",topMargin: 20,),
              CustomTextField(
                text: 'User name',
                icon: 'user',
                hint: 'Enter your user name',
                topMargin: 30.h,
                onChanged: (value) {},
              ),
              CustomTextField(
                text: 'Email',
                icon: 'user',
                hint: 'Enter your email address',
                topMargin: 20.h,
                onChanged: (value) {},
              ),
              CustomTextField(
                text: 'Password',
                icon: 'lock',
                hint: 'Enter your password',
                topMargin: 20.h,
                onChanged: (value) {},
              ),
              CustomTextField(
                text: 'Confirm Password',
                icon: 'lock',
                hint: 'Enter your Confirm Password',
                topMargin: 20.h,
                onChanged: (value) {},
              ),
              Text(
                'By creating an account you have to agree with your our them & condication.',
                style: TextStyle(
                    
                    color: AppColors.primaryFourElementText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ),
              CustomBotton(
                onTap: () {
                  // SignInController(context: context).handleSignIn('Email');
                },
                bottonName: 'Sign Up',
              )
            ],
          ),
        ),
      )),
    );
  }
}
