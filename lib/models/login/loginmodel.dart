import 'dart:convert';

WelcomeLogin welcomeLoginFromJson(String str) => WelcomeLogin.fromJson(json.decode(str));

String welcomeLoginToJson(WelcomeLogin data) => json.encode(data.toJson());

class WelcomeLogin {
  WelcomeLogin({
    this.response,
    this.message,
  });

  String? response;
  String? message;

  factory WelcomeLogin.fromJson(Map<String, dynamic> json) => WelcomeLogin(
    response: json["response"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "message": message,
  };
}
