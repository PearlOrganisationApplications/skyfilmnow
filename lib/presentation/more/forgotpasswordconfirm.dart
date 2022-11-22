import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyfilmnow/presentation/more/show_toast.dart';

import '../../theme_dark_light/change_theme.dart';
import '../../theme_dark_light/themes.dart';
import 'forgot_code_authenticate].dart';

class ForgotConfirmPasword extends StatefulWidget {
  const ForgotConfirmPasword({Key? key}) : super(key: key);

  @override
  State<ForgotConfirmPasword> createState() => _ForgotConfirmPaswordState();
}

class _ForgotConfirmPaswordState extends State<ForgotConfirmPasword> {
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _confirmPasswordController=TextEditingController();
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
                        setState(() {
                          navigateToFormatEmaiPhone = false;
                        });
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
                Center(child: Image(image: AssetImage("assets/confirmPassword.jpg"),height: height*0.25)),
                SizedBox(
                  height: height*0.05,
                ),
                Center(child:
                Text("Please enter a new password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),),

                SizedBox(
                  height: height*0.07,
                ),
                Container(
                  alignment: Alignment.center,
                    height: height * 0.07,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all( color:  Colors.grey.shade600)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.visibility_off),
                        ),
                        Flexible(
                          child: Row(
                            
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
                                        hintText: "Password",
                                        hintStyle: TextStyle( ),
                                        border:
                                        OutlineInputBorder(borderSide: BorderSide.none)),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.key),
                              ),

                            ],
                          ),
                        ),
                      ],
                    )

                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                    alignment: Alignment.center,
                    height: height * 0.07,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all( color:  Colors.grey.shade600)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.visibility_off),
                        ),
                        Flexible(
                          child: Row(

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
                                        hintText: "Confirm Password",
                                        hintStyle: TextStyle( ),
                                        border:
                                        OutlineInputBorder(borderSide: BorderSide.none)),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.key),
                              ),

                            ],
                          ),
                        ),
                      ],
                    )

                ),
                SizedBox(
                  height: height * 0.05,
                ),
                MaterialButton(
                  onPressed: () {
                    _validatePasswordConfirm();
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

  _validatePasswordConfirm(){
    // bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text);
    // bool validNumber = RegExp( r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phoneNumber.text);
    if(_passwordController.text.trim().isEmpty &&  _confirmPasswordController.text.isEmpty && _passwordController.text.isEmpty ){
      customToast("please fill the fields");
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
      customToast("Successfully created password");
    }
  }
}
