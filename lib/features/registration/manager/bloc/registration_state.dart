part of 'registration_bloc.dart';

class RegistrationState {
  final String userName, email, password, rePassword;
  const RegistrationState(
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});

  RegistrationState copyWith(
      {String? userName, String? email, String? password, String? rePassword}) {
    return RegistrationState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}

//final class RegistrationInitial extends RegistrationState {}
