import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfilmnow/presentation/more/profile.dart';
import 'package:skyfilmnow/presentation/more/registration.dart';

import '../../data/navbarItem/navbar_item.dart';
import '../../navigationCubit/navigation_cubit.dart';
import '../home/component/homepage_inital.dart';
import 'login_page.dart';
class LogOutAlertContext extends StatefulWidget {
  const LogOutAlertContext({Key? key}) : super(key: key);

  @override
  State<LogOutAlertContext> createState() => _LogOutAlertContextState();
}

class _LogOutAlertContextState extends State<LogOutAlertContext> {
  @override
  Widget build(BuildContext context) {
    double width =  MediaQuery.of(context).size.width ;
    double height =  MediaQuery.of(context).size.height ;
    return AlertDialog(
      title: Text("Are you sure you want to log out"),
      actions: [
        Container(
          width: width,
          height: height*0.1,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: ()   {
                      setState((){
                        loginSaved = false;
                      });
                    Navigator.of(context).pop();
                      // BlocProvider.of<NavigationCubit>(context)
                      //     .getNavbarItem(NavbarItem.home);
                      // NavigationCubit().addListener(() {
                      //   ProfileTheme();
                      // });
                    },
                    child: Text("Log out",style: TextStyle(color: Colors.red),)),
                InkWell(
                    onTap: (){
                      setState(() {
                        loginSaved = true;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel",style: TextStyle(color: Colors.grey),))
              ],
            ),
          ),
        )
      ],
    );
  }
}

