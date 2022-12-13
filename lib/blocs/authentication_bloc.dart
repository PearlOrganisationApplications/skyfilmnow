import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyfilmnow/blocs/authentication_event.dart';
import 'package:skyfilmnow/blocs/authentication_state.dart';

import '../data/repository/authentication_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>
{
  AuthenticationBloc({required AuthenticationRepository authenticationRepository})  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
          (status) => add(AuthenticationStatusChanged(status: status)),
    );
  }


  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<AuthenticationStatus>
  _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();

    return super.close();
  }


  Future<void> _onAuthenticationStatusChanged(AuthenticationStatusChanged event, Emitter<AuthenticationState> emit)async
  {
    switch(event.status)
    {
      case AuthenticationStatus.unauthenticated:
        emit(const AuthenticationState.unauthenticated());
        break;
      case AuthenticationStatus.authenticated:
        emit(const AuthenticationState.authenticated());
        break;
      case AuthenticationStatus.unknown:
        emit(const AuthenticationState.unknown());
        break;
      default:
        return emit(const AuthenticationState.unknown());
    }

  }


  FutureOr<void> _onAuthenticationLogoutRequested(AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit)
  {

  }
}

