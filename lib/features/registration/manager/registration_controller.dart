import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/common/widgets/flutter_toast.dart';
import 'package:udemy/features/registration/manager/bloc/registration_bloc.dart';

class RegistrationController {
  final BuildContext context;
  const RegistrationController({required this.context});

  void handleEmailRegistration() async {
    final state = context.read<RegistrationBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty.");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty.");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty.");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong.");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent to your registration email. To activate it please check you email and click on the link");
      Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "The email is already in use.");
      } else if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak.");
      }
    }
  }
}
