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
        if (emailAddress.isEmpty) debugPrint('email address is empty');
        if (password.isEmpty) debugPrint('password is empty');
        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) debugPrint('user doen\'t exist');
          if (!credential.user!.emailVerified) debugPrint('not verified');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found')
            debugPrint('user not found');
          else if (e.code == 'wrong-password')
            debugPrint('wrong password provided ofr that user.');
          else if (e.code == 'invalid-email')
            debugPrint('your email format is wrong');
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
