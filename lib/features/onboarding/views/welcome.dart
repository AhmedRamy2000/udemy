import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/common/values/colors.dart';
import 'package:udemy/features/onboarding/manager/bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          body: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              return Container(
                  margin: EdgeInsets.only(top: 34.h),
                  width: 375.w,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      PageView(
                          controller: pageController,
                          onPageChanged: (index) {
                            state.page = index;
                            BlocProvider.of<WelcomeBloc>(context)
                                .add(WelcomeEvent());
                            debugPrint('page number $index');
                          },
                          children: [
                            _page(
                              1,
                              context,
                              'assets/images/boy.png',
                              'Next',
                              'First See Learning',
                              'Forget about a for of paper all knowledge in one learning',
                            ),
                            _page(
                              2,
                              context,
                              'assets/images/reading.png',
                              'Next',
                              'Connect With Everyone',
                              'Always keep in touch with your tutor & friend. let\'s get connected!',
                            ),
                            _page(
                              3,
                              context,
                              'assets/images/man.png',
                              'Get Started',
                              'Always Fascinated Learning',
                              'Anywhere, anytime. the time is at your descretion so study whenever you want.',
                            ),
                          ]),
                      Positioned(
                          bottom: 40.h,
                          child: DotsIndicator(
                            position: state.page,
                            dotsCount: 3,
                            mainAxisAlignment: MainAxisAlignment.center,
                            decorator: DotsDecorator(
                              color: AppColors.primaryFourElementText,
                              activeColor: AppColors.primaryElement,
                              size: const Size.square(8.0),
                              activeSize: const Size(20, 8),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ))
                    ],
                  ));
            },
          ),
        ));
  }

  Widget _page(
    int index,
    BuildContext context,
    String image,
    String buttonName,
    String title,
    String subTitle,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        Text(title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal)),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(subTitle,
              style: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal)),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              //do animation
              pageController.animateToPage(index,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.ease);
            } else {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const MyHome()));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
              margin: EdgeInsets.only(top: 80.h, left: 25.w, right: 25.w),
              width: 325.w,
              height: 50.w,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        color: AppColors.primaryElementText)
                  ]),
              child: Center(
                  child: Text(
                buttonName,
                style: TextStyle(
                    color: AppColors.primaryBackground,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ))),
        )
      ],
    );
  }
}
