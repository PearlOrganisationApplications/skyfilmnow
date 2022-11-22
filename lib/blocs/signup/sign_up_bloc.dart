import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:skyfilmnow/blocs/signup/sign_up_event.dart';

import 'package:skyfilmnow/blocs/signup/sign_up_state.dart';
import 'package:skyfilmnow/data/repository/authentication_repository.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  final AuthenticationRepository authenticationRepository;
    SignUpBloc({required this.authenticationRepository}) : super (SignUpState()){
      on<SignUpUserFirstName>( onSignUpUserFirstName);
      on<SignUpUserLastName>( onSignUpUserLastName);
      on<SignUpUserEmail>( onSignUpUserEmail);
      on<SignUpUserPhone>( onSignUpUserPhone);
      on<SignUpUserPassword>( onSignUpUserPassword);
    }

  FutureOr<void> onSignUpUserFirstName(SignUpUserFirstName event, Emitter<SignUpState> emit)
  {
    emit(state.copyWith(first_name: event.first_name ));
  }
  FutureOr<void> onSignUpUserLastName(SignUpUserLastName event,Emitter<SignUpState> emit){
    emit (state.copyWith(last_name: event.last_name));
  }
  FutureOr<void> onSignUpUserEmail(SignUpUserEmail event,Emitter<SignUpState> emit){
    emit(state.copyWith(email: event.email));
  }
  FutureOr<void> onSignUpUserPhone(SignUpUserPhone event,Emitter<SignUpState> emit){
    emit(state.copyWith(phone: event.phone));
  }
  FutureOr<void> onSignUpUserPassword(SignUpUserPassword event,Emitter<SignUpState> emit){
    emit(state.copyWith(password: event.password));
  }
  FutureOr<void> onSignUpSubmitted(SignUpUserSubmitted event,Emitter<SignUpState> emit){

      if(state.status.isValidated){
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        // try{
        //
        // }
      }
  }
}