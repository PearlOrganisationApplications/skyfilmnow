import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../blocs/authentication_bloc.dart';
import '../../blocs/authentication_event.dart';
import '../../data/repository/authentication_repository.dart';
import '../homepage/components/bottom_screen_page.dart';
import '../more/profile.dart';

class SplashScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checkPrefForUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _sharedToken = prefs.getString("isLoggedIn");
    if (_sharedToken != null){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff262626),
      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        context
            .read<AuthenticationBloc>()
            .add(const AuthenticationStatusChanged(
              status: AuthenticationStatus.unknown,
            ));
      }
      //UserRegisteration();
    });
  }
}
