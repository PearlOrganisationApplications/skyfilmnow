import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class that contains all your app settings
/// Consists only of Theme setting as of now
bool? isloginUser;
class MyDynamicTheme extends ChangeNotifier {

  SharedPreferences? sharedPreferences;
  MyDynamicTheme(  this.sharedPreferences) : super();
  bool get isDarkMode => sharedPreferences?.getBool("isDarkMode") ?? false;

  void setDarkMode(bool val) {
    sharedPreferences!.setBool("isDarkMode", val);
    notifyListeners();
  }
}
class SharedPrefsLogin{
  SharedPreferences? prefs;
  bool get isLogin => prefs?.getBool("isLoggedIn") ?? false;
  // void saveLoginSignUpUser(bool val) async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //  prefs.setBool("LoggedIn", val);
  // }

  static saveMessage(message)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
     prefs.setString("isLoggedIn", message);
    
  }
  static getUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   final key =  prefs.getString("myLogin");
   print("key is $key");
   key == null ? (isloginUser = false) :  (isloginUser = true);
  }
  static readUser(bool val)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setBool("LoggedIn",val);

  }
}


///******we are using the SharedPreferences to set the value in the memory so even if we close the app and reopens it, our data won't lose.
///****** Provider is used to manage the state when the dark theme is implemented on the app.*////
///**We have created a class DarkThemePreference where we are storing the bool value in for the dark theme, we have two methods for saving and retrieving the bool value**//

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

///****** Model Class Created for Provider ****///

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}

///*** We are accessing the preference value through the provider so whenever there is any change the notifyListeners() UI will be updated if we have attached the provider to the screen.