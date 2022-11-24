import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'package:skyfilmnow/Serial%20Screen/serial_about_play_screen.dart';
import 'package:skyfilmnow/models/mainslider/mainslider.dart';
import 'package:skyfilmnow/models/mainslider/mainslidermodel.dart';

import 'package:skyfilmnow/movie_screens/movie_play_and_about_section.dart';

import 'package:skyfilmnow/Serial%20Screen/serial_page.dart';
import 'package:skyfilmnow/presentation/category/component/movie_play_category.dart';

import '../../../Serial Screen/serials_dubbed.dart';
import '../../../Serial Screen/serials_eastern.dart';
import '../../../Serial Screen/serials_turkish.dart';
import '../../../Serial Screen/western_serials.dart';
import '../../../data/utils.dart';

import '../../../resources/color_manager.dart';
import '../../../theme_dark_light/change_theme.dart';

import '../../../urlLinks/links.dart';
import '../../more/profile.dart';
import 'dubbed_movies.dart';
import 'last_updated_movies.dart';
import 'package:http/http.dart' as http;
import 'myProfile.dart';

Future changeBottomNavigationBarColorIntoBlack() async {
  const BottomNavigationBarItem(
    backgroundColor: Colors.black,
    icon: Icon(Icons.more_horiz_outlined, color: Colors.grey),
  );
}

Future changeBottomNavigationBarColorIntoWhite() async {
  const BottomNavigationBarItem(
    backgroundColor: Colors.black,
    icon: Icon(Icons.more_horiz_outlined, color: Colors.grey),
  );
}

Future setblackColor() async {
  const style = SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black54,
      systemNavigationBarDividerColor: Colors.black87);
  SystemChrome.setSystemUIOverlayStyle(style);
}

Future showblackBar() async {
  setblackColor();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}

Future setwhiteColor() async {
  const style = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.white,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
}

Future showwhiteBar() async {
  setwhiteColor();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}

class HomePageInitial extends StatefulWidget {
  const HomePageInitial({Key? key}) : super(key: key);

  @override
  State<HomePageInitial> createState() => _HomePageInitialState();
}

class _HomePageInitialState extends State<HomePageInitial> {
  bool turkish = false;
  bool western = false;
  bool allregion = false;

  bool isDarkMode = false;
  bool serial = false;
  bool movies = false;

  void changeTheme(bool set, BuildContext context) {
    ///Call setDarkMode method inside our Settings ChangeNotifier class to
    ///Notify all the listeners of the change.
    Provider.of<MyDynamicTheme>(context, listen: false).setDarkMode(set);
  }

  ///change color of selected index in flutter
  int _selectedIndex = 0;
  int _selectedIndex1 = 0;

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _onSelected1(int index) {
    setState(() {
      _selectedIndex1 = index;
    });
  }

  Future<List<MainSlider>?> getMainSlider() async {
    final response = await http.get(Uri.parse(WebLinks.mainslider));
    List<MainSlider> mainslidermodeldata = [];
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var mainslider = jsondata['message'];

      for (Map item in mainslider) {
        // mainslidermodeldata.add(MainSlider.fromJson(item));
      }
    }
  }

  void initstate() {
    super.initState();
    // getMainSlider();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // Provider.of<MyDynamicTheme>(context).isDarkMode ? _darkStatusAndNavigationBar : _lightStatusAndNavigationBar;

    return Scaffold(
      // backgroundColor: isDarkMode ? darkMode.backgroundColor : lightMode.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) => Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: AppBar(
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.01,
                        right: constraints.maxWidth * 0.02,
                        top: constraints.maxHeight * 0.01,
                        bottom: constraints.maxHeight * 0.01),
                    child: IconButton(
                      icon: changeBottomNavigationColor
                          ? Icon(
                              Icons.light_mode,
                              color: Provider.of<MyDynamicTheme>(context)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            )
                          : Icon(
                              Icons.dark_mode,
                              color: Provider.of<MyDynamicTheme>(context)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                      onPressed: () {
                        changeBottomNavigationColor =
                            !changeBottomNavigationColor;
                        setState(() {
                          changeTheme(
                              Provider.of<MyDynamicTheme>(context,
                                          listen: false)
                                      .isDarkMode
                                  ? false
                                  : true,
                              context);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.01,
                        right: constraints.maxWidth * 0.02,
                        top: constraints.maxHeight * 0.01,
                        bottom: constraints.maxHeight * 0.01),
                    child: GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyProfileScreenTheme()),
                            ),
                        child: Image.asset("assets/profile.png")),
                  ),

                  // Icon()
                ],
                title: SizedBox(
                    width: constraints.maxWidth * 0.20,
                    child: Image.asset(
                      'assets/homepage_logo.png',
                      fit: BoxFit.cover,
                      color: Colors.red,
                    )),

                // title: Text('Home',style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.8),color: Colors.white.withOpacity(0.8)),),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:
                      Provider.of<MyDynamicTheme>(context).isDarkMode
                          ? Colors.black54
                          : Colors.grey.shade500,
                  //   systemNavigationBarColor: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black54 : Colors.grey.shade500,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.light,
                ),

                elevation: 0,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<MyDynamicTheme>(context).isDarkMode
                        ? Colors.black38
                        : Colors.white,
                  ),
                ),
              ),
            ),
            body: Scaffold(
              //   backgroundColor:  isDarkMode ? darkMode.backgroundColor : lightMode.backgroundColor,
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                      left: constraints.maxWidth * 0.02,
                      right: constraints.maxWidth * 0.02),
                  child: Column(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height/2,

                        margin: EdgeInsets.only(
                            left: constraints.maxWidth * 0.02,
                            right: constraints.maxWidth * 0.02),
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                              top: constraints.maxHeight * 0.05,
                              left: constraints.maxWidth * 0.02,
                              right: constraints.maxWidth * 0.02),
                          child: TextFormField(
                            //style: TextStyle(
                            //  color: Colors.white.withOpacity(0.6)),
                            //  cursorColor: Colors.white,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear),
                                  //   color: isDarkMode ? darkMode.textColor : lightMode.textColor ,
                                  onPressed: () {},
                                ),
                                hintText: "Search",
                                hintStyle: const TextStyle(
                                    //   color: isDarkMode ? darkMode.textColor : lightMode.textColor
                                    ),
                                // fillColor: Colors.white,
                                filled: true,
                                // prefixIcon: const Icon(Icons.email, color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(ColorManager.outlineBorder),
                                      style: BorderStyle.solid,
                                      width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                ),
                                labelStyle:
                                    const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: constraints.maxHeight,
                        height: constraints.maxHeight * 0.25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MoviePlayAndAboutSection()));

                                //getMainSlider();
                              },
                              child: Stack(
                                children: [
                                  Container(
                                      width: constraints.maxWidth * 0.72,
                                      margin: EdgeInsets.only(
                                          left: constraints.maxWidth * 0.01,
                                          right: constraints.maxWidth * 0.02),
                                      decoration: BoxDecoration(
                                          // color: Colors.blue,

                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            "assets/dummy_pic.png",
                                            fit: BoxFit.cover,
                                          ))),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 35,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        numbers[index].toString(),
                                        style: const TextStyle(
                                            color: Colors.yellow),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 25,
                                    right: 25,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 60,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        MoviesName[index]['movie_name'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      Container(
                        width: constraints.maxWidth,
                        margin: EdgeInsets.only(
                            left: constraints.maxWidth * 0.07,
                            right: constraints.maxWidth * 0.02),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: constraints.maxWidth,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'The Latest Serials',
                                      style: TextStyle(
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.8),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        turkish
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TurkishSerialsTheme()),
                                              )
                                            : western
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const WesternSerialsTheme()),
                                                  )
                                                : Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const EasternSerialsTheme()),
                                                  );
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              'All',
                                              style: TextStyle(
                                                  fontSize:
                                                      ResponsiveFlutter.of(
                                                              context)
                                                          .fontSize(1.8),
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.6,
                                                  color:
                                                      Provider.of<MyDynamicTheme>(
                                                                  context)
                                                              .isDarkMode
                                                          ? Colors.white
                                                          : Colors.blue),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  Provider.of<MyDynamicTheme>(
                                                              context)
                                                          .isDarkMode
                                                      ? Colors.white
                                                      : Colors.blue,
                                              size: 19,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      Provider.of<MyDynamicTheme>(context).isDarkMode
                          ? Container(
                              width: constraints.maxHeight / 0.05,
                              height: constraints.maxHeight * 0.05,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: placedata.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _onSelected(index);
                                      if (_selectedIndex == 0) {
                                        turkish = false;
                                        western = false;
                                        allregion = false;
                                      }
                                      if (_selectedIndex == 1) {
                                        setState(() {
                                          turkish = true;
                                          western = false;
                                          allregion = false;
                                        });
                                      }
                                      if (_selectedIndex == 2) {
                                        setState(() {
                                          western = true;
                                          turkish = false;
                                          allregion = false;
                                        });
                                      }
                                      if (_selectedIndex == 3) {
                                        setState(() {
                                          allregion = true;
                                          turkish = false;
                                          western = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: constraints.maxWidth * 0.18,
                                      margin: EdgeInsets.only(
                                          left: constraints.maxWidth * 0.05,
                                          right: constraints.maxWidth * 0.05),
                                      decoration: BoxDecoration(
                                          color: _selectedIndex != null &&
                                                  _selectedIndex == index
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Provider.of<MyDynamicTheme>(
                                                        context)
                                                    .isDarkMode
                                                ? Colors.white
                                                : Colors.grey.shade300,
                                          )),
                                      child: Center(
                                          child: Text(
                                        placedata[index]['name'],
                                        style: TextStyle(
                                            color: _selectedIndex != null &&
                                                    _selectedIndex == index
                                                ? Colors.black
                                                : Colors.white),
                                      )),
                                    ),
                                  );
                                },
                              ),
                            )
                          //:TODO
                          : Container(
                              width: constraints.maxHeight / 0.05,
                              height: constraints.maxHeight * 0.05,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: placedata.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _onSelected(index);
                                      if (_selectedIndex == 0) {
                                        turkish = false;
                                        western = false;
                                        allregion = false;
                                      }
                                      if (_selectedIndex == 1) {
                                        setState(() {
                                          turkish = true;
                                          western = false;
                                          allregion = false;
                                        });
                                      }
                                      if (_selectedIndex == 2) {
                                        setState(() {
                                          western = true;
                                          turkish = false;
                                          allregion = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: constraints.maxWidth * 0.18,
                                      margin: EdgeInsets.only(
                                          left: constraints.maxWidth * 0.05,
                                          right: constraints.maxWidth * 0.05),
                                      decoration: BoxDecoration(
                                          color: _selectedIndex != null &&
                                                  _selectedIndex == index
                                              ? Colors.blue.shade500
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: _selectedIndex != null &&
                                                      _selectedIndex == index
                                                  ? Colors.blue
                                                  : Colors.grey.shade300)),
                                      child: Center(
                                          child: Text(
                                        placedata[index]['name'],
                                        style: TextStyle(
                                            color: _selectedIndex != null &&
                                                    _selectedIndex == index
                                                ? Colors.white
                                                : Colors.black),
                                      )),
                                    ),
                                  );
                                },
                              ),
                            ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      turkish == true
                          ? Container(
                              width: constraints.maxHeight,
                              height: constraints.maxHeight * 0.30,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SerialPlayAndAboutSection(),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                            width: constraints.maxWidth * 0.35,
                                            margin: EdgeInsets.only(
                                              left: constraints.maxWidth * 0.03,
                                            ),
                                            decoration: BoxDecoration(
                                                // color: Colors.blue,

                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "assets/anime.png",
                                                  fit: BoxFit.cover,
                                                ))),
                                        Positioned(
                                          top: constraints.maxHeight / 80,
                                          left: constraints.maxHeight / 40,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 35,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              TurkishSerials[index]['id']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.yellow),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: constraints.maxHeight / 15,
                                          left: 17,
                                          right: 9,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 60,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              TurkishSerials[index]
                                                      ['serial_name']
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          : western == true
                              ? Container(
                                  width: constraints.maxHeight,
                                  height: constraints.maxHeight * 0.30,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    // physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SerialPlayAndAboutSection()));
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              width:
                                                  constraints.maxWidth * 0.35,
                                              margin: EdgeInsets.only(
                                                left:
                                                    constraints.maxWidth * 0.03,
                                              ),
                                              decoration: BoxDecoration(
                                                  // color: Colors.blue,

                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "assets/harem.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: constraints.maxHeight / 80,
                                              left: constraints.maxHeight / 40,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 35,
                                                height: 35,
                                                decoration: const BoxDecoration(
                                                    color: Colors.black54,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Text(
                                                  WesternSerials[index]['id']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.yellow),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom:
                                                  constraints.maxHeight / 16,
                                              left: 15,
                                              right: 9,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 60,
                                                height: 35,
                                                decoration: const BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Text(
                                                  WesternSerials[index]
                                                          ['serial_name']
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Container(
                                  width: constraints.maxHeight,
                                  height: constraints.maxHeight * 0.30,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    // physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SerialPlayAndAboutSection()));
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              width:
                                                  constraints.maxWidth * 0.35,
                                              margin: EdgeInsets.only(
                                                left:
                                                    constraints.maxWidth * 0.03,
                                              ),
                                              decoration: BoxDecoration(
                                                  // color: Colors.blue,

                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "assets/harem.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: constraints.maxHeight / 80,
                                              left: constraints.maxHeight / 40,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 35,
                                                height: 35,
                                                decoration: const BoxDecoration(
                                                    color: Colors.black54,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Text(
                                                  EasternSerials[index]['id']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.yellow),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom:
                                                  constraints.maxHeight / 16,
                                              left: 20,
                                              right: 20,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 60,
                                                height: 35,
                                                decoration: const BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Text(
                                                  EasternSerials[index]
                                                          ['serial_name']
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      Container(
                        width: constraints.maxWidth,
                        margin: EdgeInsets.only(
                            left: constraints.maxWidth * 0.07,
                            right: constraints.maxWidth * 0.02),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: constraints.maxWidth,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Last Updated Movies',
                                      style: TextStyle(
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.8),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LastUpdatedMoviesTheme()),
                                        );
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              'All',
                                              style: TextStyle(
                                                  color:
                                                      Provider.of<MyDynamicTheme>(
                                                                  context)
                                                              .isDarkMode
                                                          ? Colors.white
                                                          : Colors.blue,
                                                  fontSize:
                                                      ResponsiveFlutter.of(
                                                              context)
                                                          .fontSize(1.8),
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.6),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  Provider.of<MyDynamicTheme>(
                                                              context)
                                                          .isDarkMode
                                                      ? Colors.white
                                                      : Colors.blue,
                                              size: 19,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      Container(
                        width: constraints.maxHeight,
                        height: constraints.maxHeight * 0.30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MoviePlayCategoryScreen()));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                      width: constraints.maxWidth * 0.35,
                                      margin: EdgeInsets.only(
                                        left: constraints.maxWidth * 0.03,
                                      ),
                                      decoration: BoxDecoration(
                                          // color: Colors.blue,

                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            "assets/grown_up.png",
                                            fit: BoxFit.cover,
                                          ))),
                                  Positioned(
                                    top: constraints.maxHeight / 80,
                                    left: constraints.maxHeight / 40,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 35,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        MoviesName[index]['id'].toString(),
                                        style: const TextStyle(
                                            color: Colors.yellow),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: constraints.maxHeight / 20,
                                    left: 12,
                                    right: 8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 60,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        MoviesName[index]['movie_name']
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      Container(
                        width: constraints.maxWidth,
                        margin: EdgeInsets.only(
                            left: constraints.maxWidth * 0.07,
                            right: constraints.maxWidth * 0.02),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: constraints.maxWidth,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Dubbed',
                                      style: TextStyle(
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.8),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _selectedIndex1 == 0
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SerialDubbedTheme()),
                                              )
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DubbedmoviesTheme()));
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              'All',
                                              style: TextStyle(
                                                  color:
                                                      Provider.of<MyDynamicTheme>(
                                                                  context)
                                                              .isDarkMode
                                                          ? Colors.white
                                                          : Colors.blue,
                                                  fontSize:
                                                      ResponsiveFlutter.of(
                                                              context)
                                                          .fontSize(1.8),
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.6),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                        ? Colors.white
                                                        : Colors.blue,
                                                size: 19,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      Container(
                        width: constraints.maxHeight / 0.05,
                        height: constraints.maxHeight * 0.05,
                        child: Provider.of<MyDynamicTheme>(context).isDarkMode
                            ? Container(
                                width: constraints.maxHeight / 0.05,
                                height: constraints.maxHeight * 0.05,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: serials.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        _onSelected1(index);
                                      },
                                      child: Container(
                                        width: constraints.maxWidth * 0.18,
                                        margin: EdgeInsets.only(
                                            left: constraints.maxWidth * 0.05,
                                            right: constraints.maxWidth * 0.05),
                                        decoration: BoxDecoration(
                                            color: _selectedIndex1 != null &&
                                                    _selectedIndex1 == index
                                                ? Colors.white
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color:
                                                  Provider.of<MyDynamicTheme>(
                                                              context)
                                                          .isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey.shade300,
                                            )),
                                        child: Center(
                                            child: Text(
                                          serials[index]['name'],
                                          style: TextStyle(
                                              color: _selectedIndex1 != null &&
                                                      _selectedIndex1 == index
                                                  ? Colors.black
                                                  : Colors.white),
                                        )),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(
                                width: constraints.maxHeight / 0.05,
                                height: constraints.maxHeight * 0.05,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: serials.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        _onSelected1(index);
                                        if (_selectedIndex1 == 0) {
                                          movies = false;
                                        }
                                        if (_selectedIndex1 == 1) {
                                          setState(() {
                                            movies = true;
                                            serial = false;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: constraints.maxWidth * 0.18,
                                        margin: EdgeInsets.only(
                                            left: constraints.maxWidth * 0.05,
                                            right: constraints.maxWidth * 0.05),
                                        decoration: BoxDecoration(
                                            color: _selectedIndex1 != null &&
                                                    _selectedIndex1 == index
                                                ? Colors.blue.shade500
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: _selectedIndex1 !=
                                                            null &&
                                                        _selectedIndex1 == index
                                                    ? Colors.blue
                                                    : Colors.grey.shade300)),
                                        child: Center(
                                          child: Text(
                                            serials[index]['name'],
                                            style: TextStyle(
                                                color: _selectedIndex1 !=
                                                            null &&
                                                        _selectedIndex1 == index
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      movies == true
                          ? Container(
                              width: constraints.maxHeight,
                              height: constraints.maxHeight * 0.30,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MoviePlayTheme()));
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                            width: constraints.maxWidth * 0.35,
                                            margin: EdgeInsets.only(
                                              left: constraints.maxWidth * 0.03,
                                            ),
                                            decoration: BoxDecoration(
                                                // color: Colors.blue,

                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "assets/anime.png",
                                                  fit: BoxFit.cover,
                                                ))),
                                        Positioned(
                                          top: constraints.maxHeight / 80,
                                          left: constraints.maxHeight / 40,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 35,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                                color: Colors.black54,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            child: Text(
                                              DubbedSerialsMovies[index]['id']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.yellow),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: constraints.maxHeight / 15,
                                          right: 5,
                                          left: 13,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            child: Text(
                                              DubbedSerialsMovies[index]
                                                  ['movie_name'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              width: constraints.maxHeight,
                              height: constraints.maxHeight * 0.30,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SerialPlayAndAboutSection(),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: constraints.maxWidth * 0.35,
                                          margin: EdgeInsets.only(
                                            left: constraints.maxWidth * 0.03,
                                          ),
                                          decoration: BoxDecoration(
                                              // color: Colors.blue,

                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              "assets/dummy_pic.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: constraints.maxHeight / 80,
                                          left: constraints.maxHeight / 40,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 35,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                                color: Colors.black54,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            child: Text(
                                              DubbedSerialsMovies[index]['id']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.yellow),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: constraints.maxHeight / 20,
                                          right: 5,
                                          left: 13,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 60,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              DubbedSerialsMovies[index]
                                                  ['serial_name'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

List<int> numbers = [1, 2, 3, 4, 5];
