import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/bloc_providers.dart';
import 'package:udemy/common/values/colors.dart';
import 'package:udemy/features/onboarding/views/welcome.dart';
import 'package:udemy/features/registration/views/register.dart';
import 'package:udemy/features/sign_in/views/sign_in.dart';
import 'package:udemy/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const UdemyApp());
}

class UdemyApp extends StatelessWidget {
  const UdemyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
            builder: (context, child) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        appBarTheme: const AppBarTheme(
                            iconTheme:
                                IconThemeData(color: AppColors.primaryText),
                            elevation: 0,
                            backgroundColor: Colors.white)),
                    home: const Welcome(),
                    routes: {
                      "myHome": (constext) => const MyHome(),
                      "signIn": (context) => const SignIn(),
                      "register": (context) => const Registration(),
                    })));
  }
}
