import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/common/values/colors.dart';
import 'package:udemy/features/sign_in/manager/bloc/sign_in_bloc.dart';
import 'package:udemy/features/sign_in/manager/sign_in_controller.dart';
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
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
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
                  CustomTextField(
                    text: 'Email',
                    icon: 'user',
                    hint: 'Enter your email address',
                    topMargin: 66,
                    onChanged: (value) {
                      context.read<SignInBloc>().add(EmailEvent(value));
                    },
                  ),
                  CustomTextField(
                    text: 'Password',
                    icon: 'lock',
                    hint: 'Enter your password',
                    topMargin: 20,
                    onChanged: (value) {
                      context.read<SignInBloc>().add(PasswordEvent(value));
                    },
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
                    onTap: () {
                      SignInController(context: context).handleSignIn('Email');
                    },
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
      },
    );
  }
}
