import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:skyfilmnow/blocs/signup/sign_up_bloc.dart';
import 'package:skyfilmnow/blocs/signup/sign_up_event.dart';
import 'package:skyfilmnow/presentation/more/login_page.dart';
import 'package:skyfilmnow/presentation/more/profile.dart';
import 'dart:math' as math;
import 'package:skyfilmnow/presentation/more/show_toast.dart';
import 'package:skyfilmnow/presentation/more/textfield_name.dart';

import '../../blocs/signup/sign_up_state.dart';
import '../../data/repository/authentication_repository.dart';
import '../../models/loader/showloader.dart';
import '../../theme_dark_light/change_theme.dart';
import '../../theme_dark_light/themes.dart';
import '../homepage/components/bottom_screen_page.dart';
var globalContext;
bool loginSaved = false;
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController _confirmPasswordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
   globalContext = context;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> _containerList( double bottomHeight,double height ,double stickerBottom,double stickertop ) {
      return List.generate(2,(index) {
        if(index == 0){
          return Container(
            color: Colors.lightBlueAccent,
            width: width,
            height: height*0.00,
          );
        }
        else if(index == 1){
          return Stack(
            children: [
              Container(
                  height: height*0.9,
                  width:width,
                  decoration:   BoxDecoration(
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
                        bottomLeft: Radius.circular(width/3),
                        bottomRight: Radius.circular(width/3),
                      ))
              ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: bottomHeight),
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Register",style: TextStyle(
                        fontWeight: FontWeight.w700,fontSize: 38,color: Colors.white
                      ),),

                    ),
                  )),
              Positioned.fill(child: Padding(
                padding:   EdgeInsets.only(bottom: stickerBottom, top: stickertop),
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
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode ? setDarkTheme : setLightTheme,
      home: Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
          ),
        ),

        body: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints){
            return  SingleChildScrollView(
              reverse: false,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children:  [
                  ..._containerList(height*0.02,height *0.19, height*0.08 ,height * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height*0.04,
                        ),
                        Container(
                            height: height * 0.07,
                            width: width,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10),
                                border: Border.all( color:  Colors.grey.shade600)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    width: width,
                                    height: height * 0.07,
                                    child:
                                     TextFormField(
                                       //   onChanged: (myName)=> context.read<SignUpBloc>().add(SignUpUserFirstName(first_name: myName)),
                                          textAlign: TextAlign.right,
                                          controller: _firstName,
                                          decoration: const InputDecoration(
                                              hintText: "First Name",
                                              hintStyle: TextStyle( ),
                                              border:
                                              OutlineInputBorder(borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.person_rounded),
                                ),
                              ],
                            )
                        ),
                        SizedBox(
                          height: height*0.035,
                        ),
                        Container(
                            height: height * 0.07,
                            width: width,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10),
                                border: Border.all( color:  Colors.grey.shade600)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    width: width,
                                    height: height * 0.07,
                                    child:
                                    TextFormField(
                                      textAlign: TextAlign.right,
                                      controller: _lastName,
                                      decoration: const InputDecoration(
                                          hintText: "Last Name",
                                          hintStyle: TextStyle( ),
                                          border:
                                          OutlineInputBorder(borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.person_rounded),
                                ),
                              ],
                            )
                        ),
                        SizedBox(
                          height: height*0.035,
                        ),
                        Container(
                            height: height * 0.07,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all( color:  Colors.grey.shade600)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    width: width,
                                    height: height * 0.07,
                                    child:
                                    TextFormField(
                                      textAlign: TextAlign.right,
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                          hintText: "Type your email",
                                          hintStyle: TextStyle( ),
                                          border:
                                          OutlineInputBorder(borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.email_outlined),
                                ),
                              ],
                            )
                        ),
                        SizedBox(
                          height: height*0.035,
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
                                Flexible(
                                  child: SizedBox(
                                    width: width,
                                    height: height * 0.07,
                                    child:
                                    TextFormField(
                                      textAlign: TextAlign.right,
                                      controller: phoneNumber,
                                      decoration: const InputDecoration(
                                          hintText: "Phone number",
                                          hintStyle: TextStyle( ),
                                          border:
                                          OutlineInputBorder(borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.phone_android),
                                ),
                              ],
                            )
                        ),
                        SizedBox(
                          height: height*0.035,
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
                                Flexible(
                                  child: SizedBox(
                                    width: width,
                                    height: height * 0.07,
                                    child:
                                    TextFormField(
                                      textAlign: TextAlign.right,
                                      controller: _passwordController,
                                      decoration: const InputDecoration(
                                          hintText: "Type your password",
                                          hintStyle: TextStyle( ),
                                          border:
                                          OutlineInputBorder(borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.lock_outline),
                                ),
                              ],
                            )
                        ),
                        SizedBox(
                          height: height*0.035,
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
                                Flexible(
                                  child: SizedBox(
                                    width: width,
                                    height: height * 0.07,
                                    child:
                                    TextFormField(
                                      textAlign: TextAlign.right,
                                      controller: _confirmPasswordController,
                                      decoration: const InputDecoration(
                                          hintText: "Confirm password",
                                          hintStyle: TextStyle( ),
                                          border:
                                          OutlineInputBorder(borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.lock_outline),
                                ),
                              ],
                            )

                        ),
                        SizedBox(
                          height: height*0.02,
                        ),
                        MaterialButton(
                          onPressed: () async{

                            _validateRegister();
                          },
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          height: height * 0.07,
                          minWidth: width,
                          color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.blue.shade800 ,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color:    Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.03),
                          ),
                        ),
                        SizedBox(
                          height: height*0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already a member?",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.02, color: Colors.grey ,),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(globalContext);
                              },
                              child: Text(
                                "Sign In ",
                                style: TextStyle(

                                  fontWeight: FontWeight.w500,
                                  fontSize: height * 0.02, color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.blue.shade800 ,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height *0.02
                    ,
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child:  Container(
                        height: height* 0.10,
                        width:width*0.80,
                        decoration:   BoxDecoration(
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
                              topLeft: Radius.circular(width/3),
                              topRight: Radius.circular(width/3),
                            ))
                    ),
                  ),
                ],
              ),


            );


          }

        ),

      ),
    );
  }

  _validateRegister() {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text);
    bool validNumber = RegExp( r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phoneNumber.text);
    if(_emailController.text.trim().isEmpty &&  phoneNumber.text.isEmpty && _passwordController.text.isEmpty ){
      customToast("please fill the fields");
    }
    else if(!emailValid ){
      if(_emailController.text.isEmpty){
        customToast("please enter email");
      }
      else{
        customToast("please enter a valid email");
      }

    }
    else if(!validNumber ){
      if(phoneNumber.text.isEmpty){
        customToast("please enter phone number");
      }
      else{
        customToast("please enter a valid phone number");
      }

    }
    else if(_passwordController.text.isEmpty){
      customToast("please enter password");
    }
    else if(_confirmPasswordController.text.isEmpty){
      customToast("please enter confirm password");
    }
    else if(_passwordController.text != _confirmPasswordController.text){
      customToast("passwords must be same");
    }
    else{
      customToast("Successfully sign up");
      AuthenticationRepository().SignUp(_firstName.text.toString(),_lastName.text.toString(),_emailController.text.toString(),
          _passwordController.text.toString(),phoneNumber.text.toString()).then((response) {
        showLoader(false);
        if (response.error) {
          customToast(response.errorMessage!);
        }
        else {
          Future.delayed(const Duration(milliseconds: 200),() async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var email = await prefs.setString("email", "{$_emailController.text}");
            prefs.setBool('isLogin', true);
            print("email is ---->> + $email");
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (builder) => BottomScreenPageeTheme()),(route) => false,);
            setState(() {
              showLoader(true);
                  loginSaved = true;
            });
          });
        }
      });
    }
  }
}
// void saveLogin(bool set,BuildContext context){
//   Provider.of<MyDynamicTheme>(context,listen: false).setLogin(set);
// }
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}