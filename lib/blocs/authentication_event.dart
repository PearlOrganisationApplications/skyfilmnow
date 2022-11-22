import 'package:equatable/equatable.dart';

import '../data/repository/authentication_repository.dart';

abstract class AuthenticationEvent extends Equatable
{
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}
class AuthenticationStatusChanged extends AuthenticationEvent
{
  final AuthenticationStatus status;
  const AuthenticationStatusChanged({required this.status});
  @override
  List<Object> get props => [status];
}
class AuthenticationLogoutRequested extends AuthenticationEvent
{

}