part of 'registration_bloc.dart';

abstract class RegistrationEvent {
  const RegistrationEvent();
}

class UserNameEvent extends RegistrationEvent {
  final String userName;
  const UserNameEvent(this.userName);
}

class EmailEvent extends RegistrationEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends RegistrationEvent {
  final String password;
  const PasswordEvent(this.password);
}

class RePasswordEvent extends RegistrationEvent {
  final String repassword;
  const RePasswordEvent(this.repassword);
}
