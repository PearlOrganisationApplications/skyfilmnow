import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfilmnow/models/loader/showloader.dart';
import 'package:skyfilmnow/presentation/more/registration.dart';
import 'package:skyfilmnow/presentation/more/show_toast.dart';

import '../../blocs/login/sign_in_with_googl.dart';
import '../../data/repository/authentication_repository.dart';
import '../../models/apiresponse.dart';
import '../../models/login/loginmodel.dart';
import '../../theme_dark_light/change_theme.dart';
import '../../theme_dark_light/themes.dart';
import '../homepage/components/bottom_screen_page.dart';
import 'forgot_email_phon.dart';

BuildContext? mycontext;

class LoginScreenTheme extends StatelessWidget {
  const LoginScreenTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: LoginScreen(),
        );
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  APIResponse<WelcomeLogin>? loginResponse;
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    mycontext = context;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> _containerList(double bottomHeight, double height,
        double stickerTop, double stickerBottom) {
      return List.generate(2, (index) {
        if (index == 0) {
          return Container(
            color: Colors.lightBlueAccent,
            width: width,
            height: height * 0.00,
          );
        } else if (index == 1) {
          return Stack(
            children: [
              Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF3366FF),
                            Color(0xFF00CCFF),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(width / 3),
                        bottomRight: Radius.circular(width / 3),
                      ))),
              Positioned.fill(
                  child: Padding(
                padding: EdgeInsets.only(bottom: bottomHeight),
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 38,
                        color: Colors.white),
                  ),
                ),
              )),
              Positioned.fill(
                  child: Padding(
                padding:
                    EdgeInsets.only(bottom: stickerBottom, top: stickerTop),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image(image: AssetImage("assets/ic_launcher.png")),
                ),
              ))
            ],
          );
        }
        return Container();
      }).toList();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            reverse: false,
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ..._containerList(
                    height * 0.04, height * 0.19, height * 0.03, height * 0.10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      _isSigningIn
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : InkWell(
                              onTap: () {
                                _validateLogin();
                                // await Navigator.of(context).push(ProfileTheme());

                                setState(() {
                                  _isSigningIn = true;
                                });
                              },
                              child: Container(
                                  height: height * 0.07,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Login with Google",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      // SizedBox(
                                      //   width: width * 0.02,
                                      // ),
                                      Image(
                                        image: const AssetImage(
                                          "assets/googlee.png",
                                        ),
                                        width: width * 0.2,
                                      )
                                    ],
                                  )),
                            ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Container(
                          height: height * 0.07,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade400)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login with Facebook",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Image(
                                image: const AssetImage(
                                  "assets/fb.ico",
                                ),
                                width: width * 0.1,
                              )
                            ],
                          )),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                        height: height * 0.001,
                        width: width,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                          height: height * 0.07,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade600)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(Icons.email_outlined),
                              ),
                              Flexible(
                                child: SizedBox(
                                  width: width,
                                  height: height * 0.07,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                        hintText: "Type your email",
                                        hintStyle: TextStyle(),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ),
                              // const Padding(
                              //   padding: EdgeInsets.only(right: 10),
                              //   child: Icon(Icons.email_outlined),
                              // ),
                            ],
                          )),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                          height: height * 0.07,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade600)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(Icons.lock_outline),
                              ),
                              Flexible(
                                child: SizedBox(
                                  width: width,
                                  height: height * 0.07,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                        hintText: "Type your password",
                                        hintStyle: TextStyle(),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ),
                              // const Padding(
                              //   padding: EdgeInsets.only(right: 10),
                              //   child: Icon(Icons.lock_outline),
                              // ),
                            ],
                          )),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          setState(() {
                            _isSigningIn = true;
                          });
                          User? user = await Authentication.signInWithGoogle(
                              context: context);

                          setState(() {
                            _isSigningIn = false;
                          });

                          if (user != null) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      const BottomScreenPageeTheme()),
                              (route) => false,
                            );
                            setState(() {
                              showLoader(true);
                              loginSaved = true;
                            });
                          }
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             BottomScreenPageeTheme()),
                          //     (route) => false);
                          // _validateLogin();
                          // // await Navigator.of(context).push(ProfileTheme());
                          // }
                        },
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        height: height * 0.07,
                        minWidth: width,
                        color: Provider.of<MyDynamicTheme>(context).isDarkMode
                            ? Colors.white
                            : Colors.blue.shade800,
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              color: Provider.of<MyDynamicTheme>(context)
                                      .isDarkMode
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.03),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do not have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.02,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: Text(
                              "Create new",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.02,
                                color: Provider.of<MyDynamicTheme>(context)
                                        .isDarkMode
                                    ? Colors.white
                                    : Colors.blue.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotEmailPhone()));
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.02,
                              color: Provider.of<MyDynamicTheme>(context)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.blue.shade800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: height * 0.10,
                      width: width * 0.80,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xFF3366FF),
                                Color(0xFF00CCFF),
                              ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(width / 3),
                            topRight: Radius.circular(width / 3),
                          ))),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  _validateLogin() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    //bool strongPassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(passwordController.text);
    if (emailController.text.trim().isEmpty &&
        passwordController.text.isEmpty) {
      customToast("please fill all the fields");
    } else if (!emailValid) {
      if (emailController.text.trim().isEmpty) {
        customToast("please enter email");
      }
      customToast("please enter a valid email");
    } else if (passwordController.text.isEmpty) {
      customToast("please enter password");
    } else {
      AuthenticationRepository()
          .loginUser(
        emailController.text,
        passwordController.text,
      )
          .then((response) {
        setState(() {});
        if (response.error) {
          customToast(response.errorMessage!);
        } else {
          print(response.data!.message);
          loginResponse = response;
          SharedPrefsLogin.saveMessage(jsonEncode(response.data!.message));
          SharedPrefsLogin.readUser(true);
          print(SharedPrefsLogin.readUser(true));

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => BottomScreenPageeTheme()),
              (route) => false);
          customToast(response.data!.message!);

          setState(() {
            isloginUser = true;
          });
        }
      });
    }
  }
  // void savedLoginUser(bool set,BuildContext context){
  //   Provider.of<SharedPrefsLogin>(context,listen: false).saveLoginSignUpUser(set);
  // }
}
