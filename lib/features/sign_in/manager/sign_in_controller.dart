import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/features/sign_in/manager/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  void handleSignIn(String type) async {
    try {
      if (type == 'Email') {
        //BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) ;
        if (password.isEmpty) ;
        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) ;
          if (!credential.user!.emailVerified) ;
        } catch (e) {}
      }
    } catch (e) {}
  }
}
