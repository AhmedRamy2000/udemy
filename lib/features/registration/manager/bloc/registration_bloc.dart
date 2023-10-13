import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_repasswordEvent);
  }
  void _userNameEvent(UserNameEvent event, Emitter<RegistrationState> emit) {
    debugPrint(event.userName);
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegistrationState> emit) {
    debugPrint(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegistrationState> emit) {
    debugPrint(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _repasswordEvent(RePasswordEvent event, Emitter<RegistrationState> emit) {
    debugPrint(event.repassword);
    emit(state.copyWith(userName: event.repassword));
  }
}
