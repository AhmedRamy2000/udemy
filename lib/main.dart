import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/views/welcome/bloc/bloc/welcome_bloc.dart';
import 'package:udemy/views/welcome/welcome.dart';

void main() {
  runApp(const UdemyApp());
}

class UdemyApp extends StatelessWidget {
  const UdemyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WelcomeBloc(),
        child: ScreenUtilInit(
            builder: (context,child) => const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Welcome(),
                )));
  }
}
