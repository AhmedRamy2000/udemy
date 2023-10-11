import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy/bloc/app_bloc.dart';
import 'package:udemy/features/onboarding/manager/bloc/welcome_bloc.dart';
import 'package:udemy/features/onboarding/views/welcome.dart';
import 'package:udemy/features/sign_in/manager/bloc/sign_in_bloc.dart';
import 'package:udemy/features/sign_in/views/sign_in.dart';
import 'package:udemy/home.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const UdemyApp());
}

class UdemyApp extends StatelessWidget {
  const UdemyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => AppBloc(),
          ),
          BlocProvider(
            create: (context) => SignInBloc(),
          ),
        ],
        child: ScreenUtilInit(
            builder: (context, child) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    builder: FToastBuilder(),
                    theme: ThemeData(
                        appBarTheme: const AppBarTheme(
                            elevation: 0, backgroundColor: Colors.white)),
                    home: const Welcome(),
                    routes: {
                      "myHome": (constext) => const MyHome(),
                      "signIn": (context) => const SignIn()
                    })));
  }
}
