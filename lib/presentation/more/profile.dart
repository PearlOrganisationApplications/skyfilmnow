import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfilmnow/homePageBloc/homepage_bloc.dart';
import 'package:skyfilmnow/homePageBloc/homepage_event.dart';
import 'package:skyfilmnow/presentation/more/profile_info.dart';
import 'package:skyfilmnow/presentation/more/registration.dart';
import 'package:skyfilmnow/presentation/more/settings.dart';
import 'package:skyfilmnow/presentation/more/watchlist.dart';
import 'package:skyfilmnow/theme_dark_light/change_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme_dark_light/themes.dart';
import '../category/component/category_initial_screen.dart';
import '../home/component/homepage_inital.dart';
import 'login_page.dart';
import 'logout_alert.dart';

bool changeBottomNavigationColor = true;
bool switchValue = false;
bool itemOne = false;
bool itemtwo = false;
bool? getvalue;

class ProfileTheme extends StatelessWidget {
  const ProfileTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: Profile(),
        );
      },
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return WillPopScope(
        onWillPop: _onWillPopCallback,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<MyDynamicTheme>(context).isDarkMode
              ? setDarkTheme
              : setLightTheme,
          home: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: AppBar(
                    systemOverlayStyle: SystemUiOverlayStyle(
                  //     systemNavigationBarColor: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black54 : Colors.grey.shade500,
                  statusBarColor:
                      Provider.of<MyDynamicTheme>(context).isDarkMode
                          ? Colors.black54
                          : Colors.white10,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.light,
                )),
              ),
              //backgroundColor: Color(0xff151515),
              body: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      //color: const Color(0xff272727)
                      ),
                  width: constraints.maxWidth,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: constraints.maxHeight * 0.05,
                            right: constraints.maxWidth * 0.05,
                            top: constraints.maxHeight * 0.05),
                        padding: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            right: constraints.maxWidth * 0.05,
                            top: constraints.maxHeight * 0.05,
                            bottom: constraints.maxHeight * 0.05),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                Provider.of<MyDynamicTheme>(context).isDarkMode
                                    ? Color(0xff3c3c3c)
                                    : Colors.grey.shade200),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/user_profile.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.05,
                            ),
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    isloginUser == true
                                        ? Text(
                                            'Hamayun Andiwal',
                                            style: TextStyle(
                                                fontSize: ResponsiveFlutter.of(
                                                        context)
                                                    .fontSize(1.8),
                                                color: Provider.of<
                                                                MyDynamicTheme>(
                                                            context)
                                                        .isDarkMode
                                                    ? Colors.white
                                                    : const Color(0xff3c3c3c),
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(""),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.02,
                                    ),
                                    isloginUser!
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffFECF31)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: constraints
                                                                .maxWidth *
                                                            0.01),
                                                    height:
                                                        constraints.maxHeight *
                                                            0.05,
                                                    width:
                                                        constraints.maxWidth *
                                                            0.05,
                                                    child: Image.asset(
                                                      "assets/crown.png",
                                                      fit: BoxFit.cover,
                                                      color: const Color(
                                                          0xffFECF31),
                                                    )),
                                                SizedBox(
                                                  width: constraints.maxWidth *
                                                      0.02,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right:
                                                          constraints.maxWidth *
                                                              0.01),
                                                  child: Text(
                                                    'Login',
                                                    style: TextStyle(
                                                      color:
                                                          Provider.of<MyDynamicTheme>(
                                                                      context)
                                                                  .isDarkMode
                                                              ? Colors.white
                                                              : const Color(
                                                                  0xff3c3c3c),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginScreenTheme()));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffFECF31)),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: constraints.maxWidth *
                                                        0.05,
                                                    right:
                                                        constraints.maxWidth *
                                                            0.05,
                                                    top: constraints.maxHeight *
                                                        0.01,
                                                    bottom:
                                                        constraints.maxHeight *
                                                            0.01),
                                                child: Text(
                                                  'Login/Register',
                                                  style: TextStyle(
                                                    color:
                                                        Provider.of<MyDynamicTheme>(
                                                                    context)
                                                                .isDarkMode
                                                            ? Colors.white
                                                            : const Color(
                                                                0xff3c3c3c),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.02,
                                    ),
                                    isloginUser == true
                                        ? GestureDetector(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffFECF31)),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: constraints
                                                                .maxWidth *
                                                            0.01),
                                                    height:
                                                        constraints.maxHeight *
                                                            0.05,
                                                    width:
                                                        constraints.maxWidth *
                                                            0.05,
                                                    // child: Image.asset(
                                                    //   "assets/crown.png",
                                                    //   fit: BoxFit.cover,
                                                    //   color: const Color(
                                                    //       0xffFECF31),
                                                    // ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        constraints.maxWidth *
                                                            0.02,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: constraints
                                                                .maxWidth *
                                                            0.08),
                                                    child: Text(
                                                      'Log out',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                                ? Colors.white
                                                                : const Color(
                                                                    0xff3c3c3c),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () async {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.remove("myLogin");
                                              setState(() {
                                                isloginUser = false;
                                                // showDialog(context: context, builder: (context){
                                                //   return LogOutAlertContext();
                                                // });
                                              });
                                            },
                                          )
                                        : const Text("")
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      isloginUser == true
                          ? profileCard(constraints, 'Profile', Icons.person)
                          : Container(),
                      profileCard(
                          constraints, 'Support', Icons.headphones_outlined,
                          index: 1),
                      //  profileCard(constraints,'We dont need this now',Icons.person),
                      profileCard(constraints, 'Watchlist',
                          Icons.speaker_notes_outlined,
                          index: 2),
                      profileCard(constraints, 'Settings', Icons.settings,
                          index: 3),
                      profileCard(
                          constraints, 'App Update', Icons.update_outlined),
                      profileCard(constraints, 'NightVersion', Icons.dark_mode,
                          index: 6),
                      profileCard(constraints, 'Advanced Search',
                          Icons.search_outlined),
                      // profileCard(constraints,'Download Manager',Icons.person),
                    ],
                  ),
                ),
              )),
        ),
      );
    });
  }

  Widget profileCard(BoxConstraints constraints, String text, IconData icon,
      {int? index}) {
    return Provider.of<MyDynamicTheme>(context).isDarkMode
        ? GestureDetector(
            onTap: () {
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsTheme()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WatchList()),
                );
              } else if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileInfoTheme();
                }));
              }
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: constraints.maxWidth * 0.05,
                  right: constraints.maxWidth * 0.05,
                  top: constraints.maxHeight * 0.02,
                  bottom: constraints.maxHeight * 0.02),
              decoration: BoxDecoration(
                  color: (index == 1)
                      ? Colors.yellow
                      : (index == 2)
                          ? Colors.white
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff767676))),
              width: constraints.maxWidth,
              child: Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.05,
                    right: constraints.maxWidth * 0.05,
                    bottom: constraints.maxHeight * 0.02,
                    top: constraints.maxHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(icon,
                            color: (index == 1)
                                ? Colors.black
                                : (index == 2)
                                    ? Colors.black
                                    : Colors.white),
                        SizedBox(
                          width: constraints.maxWidth * 0.05,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                              color: (index == 1)
                                  ? Colors.black
                                  : (index == 2)
                                      ? Colors.black
                                      : Colors.white),
                        )
                      ],
                    ),
                    index == 6
                        ? CupertinoSwitch(
                            activeColor: Colors.green,
                            trackColor: Colors.grey,
                            value: switchValue,
                            onChanged: (value) {
                              print("value is " + "$value");
                              // value  ? showblackBar(): showwhiteBar();
                               // print("changeBottomNavigationColor "  +  "$changeBottomNavigationColor");
                              setState(() {
                                changeTheme(
                                    Provider.of<MyDynamicTheme>(context,
                                                listen: false)
                                            .isDarkMode
                                        ? false
                                        : true,
                                    context);
                                switchValue = value;
                                changeBottomNavigationColor = true;
                                print("changeBottomNavigationColor background "
                                    "is $changeBottomNavigationColor");
                                changeBottomNavigationColor
                                    ? showwhiteBar()
                                    : showblackBar();
                              });
                            })
                        : Icon(Icons.arrow_forward_ios,
                            color: (index == 1)
                                ? Colors.black
                                : (index == 2)
                                    ? Colors.black
                                    : Colors.white)
                  ],
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsTheme()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WatchList()),
                );
              } else if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileInfoTheme();
                }));
              }
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: constraints.maxWidth * 0.05,
                  right: constraints.maxWidth * 0.05,
                  top: constraints.maxHeight * 0.02,
                  bottom: constraints.maxHeight * 0.02),
              decoration: BoxDecoration(
                  color: (index == 1)
                      ? Colors.yellow
                      : (index == 2)
                          ? Colors.blue
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xff767676))),
              width: constraints.maxWidth,
              child: Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.05,
                    right: constraints.maxWidth * 0.05,
                    bottom: constraints.maxHeight * 0.02,
                    top: constraints.maxHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(icon, color: Colors.black),
                        SizedBox(
                          width: constraints.maxWidth * 0.05,
                        ),
                        Text(
                          text,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    index == 6
                        ? CupertinoSwitch(
                            activeColor: Colors.green,
                            trackColor: Colors.grey,
                            value: switchValue,
                            onChanged: (value) async {
                              setState(() {
                                switchValue = value;
                                print("lower light value is " + "$value");

                                changeBottomNavigationColor =
                                    !changeBottomNavigationColor;
                                print("changeBottomNavigationColor "
                                    "is $changeBottomNavigationColor");
                                changeBottomNavigationColor

                                    ? showwhiteBar()
                                    : showblackBar();
                                changeTheme(
                                    Provider.of<MyDynamicTheme>(context,
                                                listen: false)
                                            .isDarkMode
                                        ? false
                                        : true,
                                    context);

                                // ThemeProvider themeProvider = Provider.of<ThemeProvider>(
                                //     context,
                                //     listen: false
                                // );
                                // themeProvider.swapTheme();
                              });
                            })
                        : Icon(Icons.arrow_forward_ios, color: Colors.black)
                  ],
                ),
              ),
            ),
          );
  }

  void changeTheme(bool set, BuildContext context) async {
    ///Call setDarkMode method inside our Settings ChangeNotifier class to
    ///Notify all the listeners of the change.
    Provider.of<MyDynamicTheme>(context, listen: false).setDarkMode(set);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("bottomColor", set);
    print(set);
  }

  void changeColor(int? index) {
    if (index == 1) {
      itemOne = true;
    } else if (index == 2) {
      itemtwo = true;
    }
  }

  Future<bool> _onWillPopCallback() async {
    context.read<HomePageBloc>().add(HomePageInitialScreen());
    return false;
  }
}
