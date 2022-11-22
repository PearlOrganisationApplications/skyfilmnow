import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable{
const SignUpEvent();
@override
List<Object> get props => [];
}

class SignUpUserFirstName extends SignUpEvent{
  const SignUpUserFirstName(this.first_name);
  final String first_name;

  @override
  List<Object> get props => [first_name];
}

class SignUpUserLastName extends SignUpEvent{
  const SignUpUserLastName(this.last_name);
  final String last_name;

  @override
  List<Object> get props => [last_name];
}

class SignUpUserEmail extends SignUpEvent{
  const SignUpUserEmail( this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpUserPhone extends SignUpEvent{
  const SignUpUserPhone( this.phone);
  final String phone;

  @override
  List<Object> get props => [phone];
}

class SignUpUserPassword extends SignUpEvent{
  const SignUpUserPassword( this.password);
  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpUserSubmitted extends SignUpEvent { }