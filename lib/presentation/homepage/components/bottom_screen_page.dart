import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/navbarItem/navbar_item.dart';
import '../../../homePageBloc/homepage_bloc.dart';
import '../../../homePageBloc/homepage_event.dart';
import '../../../navigationCubit/navigation_cubit.dart';
import '../../../navigationCubit/navigation_state.dart';
import '../../../theme_dark_light/change_theme.dart';
import '../../../theme_dark_light/themes.dart';
import '../../category/category_page.dart';
import '../../category/component/category_initial_screen.dart';
import '../../more/profile.dart';
import '../../home/homee.dart';
import '../../search/search_page.dart';

class BottomScreenPageeTheme extends StatelessWidget {
  const BottomScreenPageeTheme({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const BottomScreenPagee(),
        );
      },
    );
  }
}
class BottomScreenPagee extends StatefulWidget {
  final VoidCallback? onBottomNavigationTap;
  const BottomScreenPagee({Key? key, this.onBottomNavigationTap})
      : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const BottomScreenPagee());
  }

  @override
  State<BottomScreenPagee> createState() => _BottomScreenPageeState();
}

class _BottomScreenPageeState extends State<BottomScreenPagee> {
  @override
  Widget build(BuildContext context) {
    bool themeColor = Provider.of<MyDynamicTheme>(context).isDarkMode;
    return
      MaterialApp(
      theme: themeColor ? setDarkTheme : setLightTheme,
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar:

        FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            return ChangeNotifierProvider<MyDynamicTheme>.value(
              value: MyDynamicTheme(snapshot.data),
              child: BlocBuilder<NavigationCubit, NavigationState>(
                builder: (context, state) {
                  // checkPrefForUser(bool val)async{
                  //   SharedPreferences prefs = await SharedPreferences.getInstance();
                  //   bool? changeBottomColor = prefs.getBool("bottomColor");
                  //   val = changeBottomColor!;
                  // }
                  return
                    BottomNavigationBar(
                    selectedLabelStyle: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.3),
                        fontWeight: FontWeight.bold),
                    selectedItemColor: Provider.of<MyDynamicTheme>(
                      context,
                    ).isDarkMode
                        ? Colors.white
                        : Colors.blue,
                    //  unselectedItemColor: Colors.white,
                    type: BottomNavigationBarType.shifting,
                    showUnselectedLabels: false,
                    currentIndex: state.index,
                    items: [
                      BottomNavigationBarItem(

                        backgroundColor:
                            Provider.of<MyDynamicTheme>(context).isDarkMode
                                ? Colors.black38
                                : Colors.white,
                        activeIcon: Icon(
                          Icons.more_horiz_outlined,
                          color:
                              Provider.of<MyDynamicTheme>(context).isDarkMode
                                  ? Colors.white
                                  : Colors.blue,
                        ),
                        icon: const Icon(Icons.more_horiz_outlined,
                            color: Colors.grey),
                        label: 'More',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor:
                            Provider.of<MyDynamicTheme>(context).isDarkMode
                                ? Colors.black38
                                : Colors.white,
                        activeIcon: Icon(
                          Icons.home,
                          color:
                              Provider.of<MyDynamicTheme>(context).isDarkMode
                                  ? Colors.white
                                  : Colors.blue,
                        ),
                        icon: const Icon(Icons.home, color: Colors.grey),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor:
                            Provider.of<MyDynamicTheme>(context).isDarkMode
                                ? Colors.black38
                                : Colors.white,
                        activeIcon: Icon(
                          Icons.category_outlined,
                          color:
                              Provider.of<MyDynamicTheme>(context).isDarkMode
                                  ? Colors.white
                                  : Colors.blue,
                        ),
                        icon:
                            const Icon(Icons.category_outlined, color: Colors.grey),
                        label: 'Category',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor:
                            Provider.of<MyDynamicTheme>(context).isDarkMode
                                ? Colors.black38
                                : Colors.white,
                        activeIcon: Icon(
                          Icons.search_outlined,
                          color:
                              Provider.of<MyDynamicTheme>(context).isDarkMode
                                  ? Colors.white
                                  : Colors.blue,
                        ),
                        icon: const Icon(Icons.search_outlined, color: Colors.grey),
                        label: 'Genre',
                      ),
                    ],
                    onTap: (index) {
                      if (index == 0) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavbarItem(NavbarItem.more);

                        print("index is 0");
                      } else if (index == 1) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavbarItem(NavbarItem.home);
                        print("index is 1");
                      } else if (index == 2) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavbarItem(NavbarItem.category);
                        print("index is 2");
                      } else if (index == 3) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavbarItem(NavbarItem.genre);
                        print("index is 3");
                      }
                    },
                  );
                },
              ),
            );
          },
        ),
        body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return const HomeTheme();
          } else if (state.navbarItem == NavbarItem.more) {
            return const ProfileTheme();
          } else if (state.navbarItem == NavbarItem.category) {
            return const CategoryTheme();
          } else if (state.navbarItem == NavbarItem.genre) {
            return const SearchTheme();
          }
          return Container();
        }),
      ),
    );
  }
}

void changeTheme(bool set, BuildContext context, Colors myColor) {
  ///Call setDarkMode method inside our Settings ChangeNotifier class to
  ///Notify all the listeners of the change.
  Provider.of<MyDynamicTheme>(context, listen: false).setDarkMode(set);
  print(set);
}
// class BottomScreenPage extends StatelessWidget {
//   static Route route() {
//     return MaterialPageRoute<void>(builder: (_) => const BottomScreenPage());
//   }
//
//   const BottomScreenPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         resizeToAvoidBottomInset: false,
//         bottomNavigationBar: FutureBuilder<SharedPreferences>(
//           future: SharedPreferences.getInstance(),
//           builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot){
//             return ChangeNotifierProvider<MyDynamicTheme>.value(value:  MyDynamicTheme(snapshot.data),
//               child: BlocBuilder<NavigationCubit, NavigationState>(
//                 builder: (context, state) {
//                   return BottomNavigationBar(
//                     selectedLabelStyle: TextStyle(
//                         fontSize: ResponsiveFlutter.of(context).fontSize(1.3),
//                         fontWeight: FontWeight.bold),
//                     // backgroundColor:  Colors.yellow,
//                         selectedItemColor: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue,
//                     // unselectedItemColor: Colors.white,
//                     type: BottomNavigationBarType.shifting,
//                     showUnselectedLabels: false,
//                     currentIndex: state.index,
//
//                     items:   [
//                         BottomNavigationBarItem(
//                         backgroundColor:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black : Colors.white,
//                         activeIcon: Icon(Icons.more_horiz_outlined, color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue,),
//                         icon: Icon(Icons.more_horiz_outlined, color: Colors.grey),
//                         label: 'More',
//                       ),
//                         BottomNavigationBarItem(
//                         backgroundColor: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black : Colors.white,
//                         activeIcon: Icon(Icons.home, color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue,),
//                         icon: Icon(Icons.home, color: Colors.grey),
//                         label: 'Home',
//                       ),
//                         BottomNavigationBarItem(
//                         backgroundColor: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black : Colors.white,
//                         activeIcon: Icon(Icons.category_outlined, color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue,),
//                         icon: Icon(Icons.category_outlined, color: Colors.grey),
//                         label: 'Category',
//                       ),
//                         BottomNavigationBarItem(
//                         backgroundColor: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black : Colors.white,
//                         activeIcon: Icon(Icons.search_outlined, color:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue,),
//                         icon: Icon(Icons.search_outlined, color: Colors.grey),
//                         label: 'Genre',
//                       ),
//                     ],
//                     onTap: (index) {
//                       if (index == 0) {
//                         // LayoutBuilder(builder: (context, constraints) {
//                         //   return WillPopScope(
//                         //     onWillPop: _onWillPopCallback,
//                         //     child: Scaffold(
//                         //         backgroundColor: Color(0xff151515),
//                         //         appBar: AppBar(
//                         //           actions: [
//                         //             Padding(
//                         //               padding: EdgeInsets.only(
//                         //                   left: constraints.maxWidth * 0.01,
//                         //                   right: constraints.maxWidth * 0.02,
//                         //                   top: constraints.maxHeight * 0.01,
//                         //                   bottom: constraints.maxHeight * 0.01),
//                         //               child: GestureDetector(
//                         //                   onTap: () {
//                         //                     print('hello');
//                         //                   },
//                         //                   child: Image.asset("assets/profile.png")),
//                         //             )
//                         //             // Icon()
//                         //           ],
//                         //           title: Text(
//                         //             'Home',
//                         //             style: TextStyle(
//                         //                 fontSize:
//                         //                     ResponsiveFlutter.of(context).fontSize(1.8),
//                         //                 color: Colors.white.withOpacity(0.8)),
//                         //           ),
//                         //           systemOverlayStyle: const SystemUiOverlayStyle(
//                         //             statusBarColor: Colors.black,
//                         //             statusBarIconBrightness: Brightness.dark,
//                         //             statusBarBrightness: Brightness.light,
//                         //           ),
//                         //           elevation: 0,
//                         //           flexibleSpace: Container(
//                         //             decoration: const BoxDecoration(
//                         //               color: Colors.black,
//                         //             ),
//                         //           ),
//                         //         ),
//                         //         body: SingleChildScrollView(
//                         //           child: Container(
//                         //             margin: EdgeInsets.only(
//                         //                 top: constraints.maxHeight * 0.15),
//                         //             decoration: BoxDecoration(
//                         //                 borderRadius: BorderRadius.circular(20),
//                         //                 color: const Color(0xff272727)),
//                         //             width: constraints.maxWidth,
//                         //             height: constraints.maxHeight,
//                         //             child: Column(
//                         //               children: [
//                         //                 Container(
//                         //                   margin: EdgeInsets.only(
//                         //                       left: constraints.maxHeight * 0.05,
//                         //                       right: constraints.maxWidth * 0.05,
//                         //                       top: constraints.maxHeight * 0.05),
//                         //                   padding: EdgeInsets.only(
//                         //                       left: constraints.maxWidth * 0.05,
//                         //                       right: constraints.maxWidth * 0.05,
//                         //                       top: constraints.maxHeight * 0.05,
//                         //                       bottom: constraints.maxHeight * 0.05),
//                         //                   decoration: BoxDecoration(
//                         //                       borderRadius: BorderRadius.circular(10),
//                         //                       color: Color(0xff3c3c3c)),
//                         //                   child: Row(
//                         //                     crossAxisAlignment: CrossAxisAlignment.start,
//                         //                     children: [
//                         //                       Container(
//                         //                         width: 100,
//                         //                         height: 100,
//                         //                         decoration: BoxDecoration(
//                         //                           shape: BoxShape.circle,
//                         //                           image: DecorationImage(
//                         //                               image: AssetImage(
//                         //                                   'assets/user_profile.png'),
//                         //                               fit: BoxFit.fill),
//                         //                         ),
//                         //                       ),
//                         //                       SizedBox(
//                         //                         width: constraints.maxWidth * 0.05,
//                         //                       ),
//                         //                       Column(
//                         //                         crossAxisAlignment:
//                         //                             CrossAxisAlignment.start,
//                         //                         children: [
//                         //                           Text(
//                         //                             'XYZXyz',
//                         //                             style: TextStyle(
//                         //                                 fontSize:
//                         //                                     ResponsiveFlutter.of(context)
//                         //                                         .fontSize(1.8),
//                         //                                 color: Colors.white,
//                         //                                 fontWeight: FontWeight.bold),
//                         //                           ),
//                         //                           SizedBox(
//                         //                             height: constraints.maxHeight * 0.02,
//                         //                           ),
//                         //                           Container(
//                         //                             decoration: BoxDecoration(
//                         //                               border: Border.all(
//                         //                                   color: Color(0xffFECF31)),
//                         //                               borderRadius:
//                         //                                   BorderRadius.circular(10),
//                         //                             ),
//                         //                             child: Row(
//                         //                               children: [
//                         //                                 Container(
//                         //                                     margin: EdgeInsets.only(
//                         //                                         left:
//                         //                                             constraints.maxWidth *
//                         //                                                 0.05),
//                         //                                     height:
//                         //                                         constraints.maxHeight *
//                         //                                             0.05,
//                         //                                     width: constraints.maxWidth *
//                         //                                         0.05,
//                         //                                     child: Image.asset(
//                         //                                       "assets/crown.png",
//                         //                                       fit: BoxFit.cover,
//                         //                                       color: Color(0xffFECF31),
//                         //                                     )),
//                         //                                 Padding(
//                         //                                   padding: EdgeInsets.only(
//                         //                                       left: constraints.maxWidth *
//                         //                                           0.05,
//                         //                                       right:
//                         //                                           constraints.maxWidth *
//                         //                                               0.05,
//                         //                                       top: constraints.maxHeight *
//                         //                                           0.01,
//                         //                                       bottom:
//                         //                                           constraints.maxHeight *
//                         //                                               0.01),
//                         //                                   child: Text(
//                         //                                     'Xyz',
//                         //                                     style: TextStyle(
//                         //                                         color: Colors.white),
//                         //                                   ),
//                         //                                 ),
//                         //                               ],
//                         //                             ),
//                         //                           )
//                         //                         ],
//                         //                       )
//                         //                     ],
//                         //                   ),
//                         //                 ),
//                         //
//                         //                 profileCard(constraints, 'Profile', Icons.person),
//                         //                 profileCard(constraints, 'Support',
//                         //                     Icons.headphones_outlined),
//                         //                 profileCard(constraints, 'We dont need this now',
//                         //                     Icons.person),
//                         //                 profileCard(constraints, 'Watchlist',
//                         //                     Icons.speaker_notes_outlined),
//                         //
//                         //                 profileCard(constraints, 'App Update',
//                         //                     Icons.update_outlined),
//                         //                 profileCard(constraints, 'Advanced Search',
//                         //                     Icons.search_outlined),
//                         //                 // profileCard(constraints,'Download Manager',Icons.person),
//                         //               ],
//                         //             ),
//                         //           ),
//                         //         )),
//                         //   );
//                         // }
//                         //
//                         //     // BlocProvider.of<NavigationCubit>(context)
//                         //     //     .getNavbarItem(NavbarItem.more);
//                         //     );
//                         BlocProvider.of<NavigationCubit>(context)
//                             .getNavbarItem(NavbarItem.more);
//                       } else if (index == 1) {
//                         BlocProvider.of<NavigationCubit>(context)
//                             .getNavbarItem(NavbarItem.home);
//                       } else if (index == 2) {
//                         BlocProvider.of<NavigationCubit>(context)
//                             .getNavbarItem(NavbarItem.category);
//                       } else if (index == 3) {
//                         BlocProvider.of<NavigationCubit>(context)
//                             .getNavbarItem(NavbarItem.genre);
//                       }
//                     },
//                   );
//                 },
//
//               ),
//             );
//           },
//
//         ),
//         body: BlocBuilder<NavigationCubit, NavigationState>(
//             builder: (context, state) {
//           if (state.navbarItem == NavbarItem.home) {
//             return HomeTheme();
//           } else if (state.navbarItem == NavbarItem.more) {
//             return ProfileTheme();
//           } else if (state.navbarItem == NavbarItem.category) {
//             return CategoryTheme();
//           } else if (state.navbarItem == NavbarItem.genre) {
//             return const SearchTheme();
//           }
//           return Container(
//
//           );
//         }),
//       );
//
//   }
// }
//
// Widget profileCard(BoxConstraints constraints, String text, IconData icon) {
//   return Container(
//     margin: EdgeInsets.only(
//         left: constraints.maxWidth * 0.05,
//         right: constraints.maxWidth * 0.05,
//         top: constraints.maxHeight * 0.02,
//         bottom: constraints.maxHeight * 0.02),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Color(0xff767676))),
//     width: constraints.maxWidth,
//     child: Padding(
//       padding: EdgeInsets.only(
//           left: constraints.maxWidth * 0.05,
//           right: constraints.maxWidth * 0.05,
//           bottom: constraints.maxHeight * 0.02,
//           top: constraints.maxHeight * 0.02),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 icon,
//                 color: Colors.white.withOpacity(0.8),
//               ),
//               SizedBox(
//                 width: constraints.maxWidth * 0.05,
//               ),
//               Text(
//                 text,
//                 style: TextStyle(color: Colors.white.withOpacity(0.8)),
//               )
//             ],
//           ),
//           Icon(
//             Icons.arrow_forward_ios,
//             color: Colors.white.withOpacity(0.8),
//           )
//         ],
//       ),
//     ),
//   );
// }
//
//
