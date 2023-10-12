import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/bloc/app_bloc.dart';
import 'package:udemy/features/onboarding/manager/bloc/welcome_bloc.dart';
import 'package:udemy/features/sign_in/manager/bloc/sign_in_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
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
      ];
}
