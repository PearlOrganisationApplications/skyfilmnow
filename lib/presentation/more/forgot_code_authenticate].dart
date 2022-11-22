import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../theme_dark_light/change_theme.dart';
import '../../theme_dark_light/themes.dart';
import 'forgot_email_phon.dart';
import 'forgotpasswordconfirm.dart';
bool navigateToFormatEmaiPhone = false;
class ForgotAuthentication extends StatefulWidget {
  const ForgotAuthentication({Key? key}) : super(key: key);

  @override
  State<ForgotAuthentication> createState() => _ForgotAuthenticationState();
}

class _ForgotAuthenticationState extends State<ForgotAuthentication> {
  StreamController<ErrorAnimationType>? errorController;
  final formKey = GlobalKey<FormState>();

  bool hasError = false;
  String currentText = "";
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();

  TextEditingController forgotAuthenticationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode ? setDarkTheme : setLightTheme  ,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Color(0xFF303031) : Colors.white,
            actions: [
              Row(
                children: [
                  Text("Forgot Password",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.w600,color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.black,)),
                  const SizedBox(
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.black,),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child:   Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                          color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height*0.05,
                ),
                Center(child: Image(image: AssetImage("assets/code_authentication.jpg"),height: height*0.25)),
                SizedBox(
                  height: height*0.03,
                ),
                Center(child:
                Text("Please enter your verification code",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.shade700),),),
                SizedBox(
                  height: height*0.04,
                ),
                Center(child:
                Text("We will send you verification code to your registered email ID ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.grey.shade600),textAlign: TextAlign.center,),),
                SizedBox(
                  height: height*0.07,
                ),
            Form(
              key: formKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                     // color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: false,
                   obscuringCharacter: '*',
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: height*0.05,
                      fieldWidth: height*0.05,
                      activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    controller: forgotAuthenticationController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                      navigateToFormatEmaiPhone = true;
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),),
                 // Center(
                 //   child: Padding(
                 //     padding:   EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                 //     child:Row(
                 //         mainAxisAlignment: MainAxisAlignment.center,
                 //         crossAxisAlignment: CrossAxisAlignment.center,
                 //         children: [
                 //           Flexible(
                 //             child: TextField(
                 //               focusNode: f1,
                 //               maxLength: 1,
                 //              keyboardType: TextInputType.number,
                 //               onChanged: (String newVal) {
                 //                 if (newVal.length == 1) {
                 //                   f1.unfocus();
                 //                   FocusScope.of(context).requestFocus(f2);
                 //                 }
                 //               },
                 //               decoration: InputDecoration(border: OutlineInputBorder()),
                 //             ),
                 //           ),
                 //           Flexible(
                 //             child: TextField(
                 //               focusNode: f2,
                 //               maxLength: 1,
                 //               keyboardType: TextInputType.number,
                 //               onChanged: (String newVal) {
                 //                 if (newVal.length == 1) {
                 //                   f2.unfocus();
                 //                   FocusScope.of(context).requestFocus(f3);
                 //                 }
                 //               },
                 //               decoration: InputDecoration(border: OutlineInputBorder()),
                 //             ),
                 //           ),
                 //           Flexible(
                 //             child: TextField(
                 //               focusNode: f3,
                 //               maxLength: 1,
                 //               keyboardType: TextInputType.number,
                 //               onChanged: (String newVal) {
                 //                 if (newVal.length == 1) {
                 //                   f3.unfocus();
                 //                   FocusScope.of(context).requestFocus(f4);
                 //                 }
                 //               },
                 //               decoration: InputDecoration(border: OutlineInputBorder()),
                 //             ),
                 //           ),
                 //           Flexible(
                 //             child: TextField(
                 //               focusNode: f4,
                 //               maxLength: 1,
                 //               keyboardType: TextInputType.number,
                 //               decoration: InputDecoration(border: OutlineInputBorder()),
                 //             ),
                 //           ),
                 //         ]),
                 //   ),
                 // ),
                SizedBox(
                  height: height * 0.06,
                ),
                MaterialButton(
                  onPressed: () {
                    setState((){
                      forgotAuthenticationController.text = "";
                    });

                    if(navigateToFormatEmaiPhone){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotConfirmPasword()));
                    }
                  },
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  height: height * 0.07,
                  minWidth: width,
                  color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.blue.shade800 ,
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color:    Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: height * 0.03),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
  //   Widget _otpTextField(BuildContext context,FocusNode first,
  // )
  // {
  //   return  Container(
  //     height: MediaQuery.of(context).size.shortestSide * 0.13,
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.grey),
  //       borderRadius: BorderRadius.circular(5),
  //       color: Colors.white,
  //       shape: BoxShape.rectangle,
  //     ),
  //     child: AspectRatio(
  //       aspectRatio: 1,
  //       child: TextField(
  //         autofocus: true,
  //         inputFormatters: [
  //         LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly
  //       ],
  //         decoration: const InputDecoration(
  //           hintText: "*",
  //           border: InputBorder.none,
  //         ),
  //         textAlign: TextAlign.center,
  //       keyboardType: TextInputType.number,
  //       //  style: TextStyle(),
  //         maxLength: 1,
  //         onChanged: (value) {
  //             if (value.length == 1  ) {
  //               FocusScope.of(context).nextFocus();
  //             }
  //
  //         },
  //       ),
  //     ),
  //   );
  // }
}
