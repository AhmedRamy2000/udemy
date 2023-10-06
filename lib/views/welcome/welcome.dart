import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/views/welcome/bloc/bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
                        onPageChanged: (index){
                          state.page =index;
                          BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                          debugPrint('page number $index');
                        },
                        children: [
                        OnBording(
                          index: 0,
                          image: 'assets/images/boy.png',
                          context: context,
                          buttonName: 'Next',
                          title: 'First See Learning',
                          subTitle:
                              'Forget about a for of paper all knowledge in one learning',
                        ),
                        OnBording(
                          index: 1,
                          image: 'assets/images/man.png',
                          context: context,
                          buttonName: 'Next',
                          title: 'Connect With Everyone',
                          subTitle:
                              'Always keep in touch with your tutor & friend. let\'s get connected!',
                        ),
                        OnBording(
                          index: 2,
                          image: 'assets/images/reading.png',
                          context: context,
                          buttonName: 'Get Started',
                          title: 'Always Fascinated Learning',
                          subTitle:
                              'Anywhere, anytime. the time is at your descretion so study whenever you want.',
                        ),
                      ]),
                      Positioned(
                          bottom: 50.h,
                          child: DotsIndicator(
                            position: state.page,
                            dotsCount: 3,
                            mainAxisAlignment: MainAxisAlignment.center,
                            decorator: DotsDecorator(
                              color: Colors.grey,
                              activeColor: Colors.blue,
                              size: const Size.square(8.0),
                              activeSize: const Size(18, 8),
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
}

class OnBording extends StatelessWidget {
  final int index;
  final BuildContext context;
  final String image;
  final String buttonName;
  final String title;
  final String subTitle;
  const OnBording({
    super.key,
    required this.index,
    required this.context,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(image,fit:BoxFit.cover),
        ),
        Text(title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal)),
        Text(subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal)),
        Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.w,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 88, 174, 245),
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(5, 10))
                ]),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            )))
      ],
    );
  }
}
