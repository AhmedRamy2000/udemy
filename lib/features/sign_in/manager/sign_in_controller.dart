import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/common/widgets/flutter_toast.dart';
import 'package:udemy/features/sign_in/manager/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  void handleSignIn(String type) async {
    try {
      if (type == 'Email'||type == 'Password') {
        //BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
        }
        if (password.isEmpty) toastInfo(msg: 'password is empty');
        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
          } else {
            toastInfo(msg: "Curremtly you are not a user of this app");
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email address format is wrong");
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
