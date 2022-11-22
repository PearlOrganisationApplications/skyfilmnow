abstract class LoginEvent {}

class LoginUsernameChanged extends LoginEvent {
  final String username;

  LoginUsernameChanged(this.username);
  @override
  List<Object?> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged( this.password);
  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends LoginEvent {

  @override
  // TODO: implement props
  List<Object?> get props =>[];


}