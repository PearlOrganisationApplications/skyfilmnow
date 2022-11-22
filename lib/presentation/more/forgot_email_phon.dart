import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyfilmnow/presentation/more/show_toast.dart';

import '../../theme_dark_light/change_theme.dart';
import '../../theme_dark_light/themes.dart';
import 'forgot_code_authenticate].dart';
import 'forgotpasswordconfirm.dart';


class ForgotEmailPhone extends StatefulWidget {
  const ForgotEmailPhone({Key? key}) : super(key: key);

  @override
  State<ForgotEmailPhone> createState() => _ForgotEmailPhoneState();
}

class _ForgotEmailPhoneState extends State<ForgotEmailPhone> {
  TextEditingController emailPhoneController=TextEditingController();
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
               Center(child: Image(image: AssetImage("assets/forgotpasswordemailphone.png"),height: height*0.25)),
                SizedBox(
                  height: height*0.03,
                ),
                Center(child:
                Text("Please enter your registered email ID/Phone",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.shade700),),),
                SizedBox(
                  height: height*0.04,
                ),
                Center(child:
                Text("We will send you verification code to your registered email ID/Phone ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.grey.shade600),textAlign: TextAlign.center,),),
                SizedBox(
                  height: height*0.07,
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
                              controller: emailPhoneController,
                              decoration: const InputDecoration(
                                  hintText: "Email/Phone",
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
                  height: height * 0.06,
                ),
                MaterialButton(
                  onPressed: () {
               _validateforgotEmailPhone();



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
  _validateforgotEmailPhone(){
    // bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text);
    // bool validNumber = RegExp( r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phoneNumber.text);
    if(emailPhoneController.text.trim().isEmpty  ){
      customToast("please fill the Email/Phone field");
    }




    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotAuthentication()));
    }
  }

}
