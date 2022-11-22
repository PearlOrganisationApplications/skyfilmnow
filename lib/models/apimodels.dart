
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'apiresponse.dart';
class APIMethods {
  int _success = 200,
      _created = 201;
  Duration _timeLimit = Duration(seconds: 30);
  String _noInternet = "Internet not available";
  final String _requestTimeOut = "Request Timeout";

  Future<APIResponse> postMethod(String URL,
      Map<String, dynamic> body,) async{
    print("URL ----> ${URL}");
    print("body ----> ${body}");
    print("body value is ${body.values.first}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("myLogin",body.values.toString());

    return http.post(Uri.parse(URL), body: body).then((response) {
      print("response ----> ${response.body}");
      if (response.statusCode == _success || response.statusCode == _created) {
        return APIResponse(error: false, data: response.body);
      } else {
        return APIResponse(
            error: true, errorMessage: jsonDecode(response.body)["messages"]);
      }
    }
    )
        .catchError((e) =>
        APIResponse(error: true,
            errorMessage: e.toString().contains("SocketException")
                ? _noInternet
                : e.toString()))
        .timeout(_timeLimit, onTimeout: () =>
        APIResponse(error: true, errorMessage: _requestTimeOut));
  }
}