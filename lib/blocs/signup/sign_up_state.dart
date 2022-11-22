import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

  class SignUpState extends Equatable{
    final String first_name;
    final String last_name;
    final String email;
    final String phone;
    final String password;
    final FormzStatus status;
  const SignUpState({this.first_name = "",this.last_name = "",this.email = "",this.password = "",this.phone = "",   this.status = FormzStatus.pure,});

  @override
  List<Object?> get props =>  [first_name,last_name,email,password,phone,status];

  SignUpState copyWith({
    FormzStatus? status,
         String? first_name,
    String? last_name,
    String? email,
    String? phone,
    String?  password

  }) {
    return SignUpState(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email :  email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      status: status ?? this.status,



    );
  }
}
