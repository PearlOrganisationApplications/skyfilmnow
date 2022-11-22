import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:skyfilmnow/blocs/login/login_event.dart';

import '../../data/repository/authentication_repository.dart';
import 'login_state.dart';

class LogIn extends Bloc<LoginEvent,LoginState> {
  final AuthenticationRepository authenticationRepository;

  LogIn({required this.authenticationRepository}) : super(LoginState());


  FutureOr<void> onLoginUserName(LoginUsernameChanged event,
      Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  FutureOr<void> onLoginpassword(LoginPasswordChanged event,
      Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }
  FutureOr<void> onLoginSubmitted(LoginSubmitted event,
      Emitter<LoginState> emit) {

    if(state.status.isValidated){
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      // try{
      //
      // }
    }

    // emit(state.copyWith(formStatus: FormSubmitting()));
  }
}