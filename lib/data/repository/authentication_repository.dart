import 'dart:async';
import 'dart:convert';
import 'package:skyfilmnow/models/apiresponse.dart';
import '../../models/apimodels.dart';
import '../../models/login/loginmodel.dart';
import '../../models/signup/registersignupmpdel.dart';
import '../../urlLinks/links.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<APIResponse<Welcome>> SignUp(
      firstName, lastName, email, password, phone) async {
    Map<String, String> body = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'pass': password,
    };
    return APIMethods().postMethod(WebLinks.signupurl, body).then((apiResponse){
      if(apiResponse.error){
        print(apiResponse.errorMessage);
        return APIResponse(
          error: true,
          errorMessage: apiResponse.errorMessage,
        );
      }
      else{
        return
        APIResponse(error: false,data: Welcome.fromJson(jsonDecode(apiResponse.data)));
      }
    });
  }

  Future<APIResponse<WelcomeLogin>> loginUser(email, password) async {
    Map<String, dynamic> body = {
      "email": email,
      "pass": password,
    };
    return APIMethods().postMethod(WebLinks.loginurl, body).then((apiResponse) {
      if (apiResponse.error) {
        print(apiResponse.errorMessage);
        return APIResponse(
          error: true,
          errorMessage: apiResponse.errorMessage,
        );
      } else {
        return APIResponse(error: false, data: WelcomeLogin.fromJson(jsonDecode(apiResponse.data)));
      }
    });
  }

  Future<void> SignOut() async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<String> ConfirmSignIn() async {
    await Future.delayed(Duration(seconds: 1));
    return "successfully sign in ";
  }


}
