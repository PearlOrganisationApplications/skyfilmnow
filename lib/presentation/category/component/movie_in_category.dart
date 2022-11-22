import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../theme_dark_light/change_theme.dart';
import '../../../theme_dark_light/themes.dart';

class MovieInCategoryScreenTheme extends StatelessWidget {
  const MovieInCategoryScreenTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const MovieInCategoryScreen(),
        );
      },
    );
  }
}

class MovieInCategoryScreen extends StatefulWidget {
  const MovieInCategoryScreen({Key? key}) : super(key: key);

  @override
  State<MovieInCategoryScreen> createState() => _MovieInCategoryScreenState();
}

class _MovieInCategoryScreenState extends State<MovieInCategoryScreen> {
  bool originalSeasonDropDown = false;
  bool originalSeason2dropdown = false;
  bool dubbedSeason1Dropdown = false;
  bool dubbed1 = false;
  bool dubbed2 = false;
  bool dubbed3 = false;
  bool openWebDropDown = false;
  bool openWeb2DropDown = false;
  bool openWeb3DropDown = false;
  bool openWeb4DropDown = false;
  int? selectedIndex;
  int? selectedIndex2;
  int? selectedIndex3;
  int? selectedIndex4;
  bool? currentIndex;
  List<Map<String, String>> myWebText = [
    {"pixels": "WEBRip-480", "size": "220MB"},
    {"pixels": "WEBRip-720", "size": "440MB"},
    {"pixels": "WEBRip-1080", "size": "880MB"}
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool themeColor = Provider.of<MyDynamicTheme>(context).isDarkMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: Scaffold(
        // backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints constraints,
          ) =>
              Column(
            children: <Widget>[
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      filterQuality: FilterQuality.high,
                      height: MediaQuery.of(context).size.height,
                      image: const AssetImage("assets/rommel.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  //  color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black :Colors.white,
                  // decoration: BoxDecoration(
                  //
                  //   borderRadius: const BorderRadius.only(
                  //     topLeft: Radius.circular(20),
                  //     topRight: Radius.circular(20),
                  //   ),
                  // ),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 10),
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      ///******************** Play Text ********************///
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Play Movie",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ///********************* Original Language Button **********************///
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 3.0, right: 20, top: 20),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: themeColor
                                      ? const Color(0xFF1C981B)
                                      : const Color(0xFFB0FDAF),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              height: 60,
                              width: 125,
                              child: const Text(
                                "Original Language",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedCrossFade(
                              firstCurve: const Interval(0.0, 0.20,
                                  curve: Curves.easeInCirc),
                              secondCurve: const Interval(0.4, 1.0,
                                  curve: Curves.fastOutSlowIn),
                              sizeCurve: Curves.bounceIn,
                              duration: const Duration(milliseconds: 400),
                              firstChild: Container(
                                height: 70,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        originalSeasonDropDown =
                                            !originalSeasonDropDown;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            width: width * 0.30,
                                            child: const Text(
                                              "BLUERay - 480p",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                        const Text(
                                          "Bia2M",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Container(
                                            width: width * 0.30,
                                            alignment: Alignment.centerRight,
                                            child: const Text(
                                              "653MB",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: Container(
                                alignment: Alignment.center,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  color: Provider.of<MyDynamicTheme>(context)
                                          .isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF0F4A5C),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            originalSeasonDropDown =
                                                !originalSeasonDropDown;
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  width: width * 0.30,
                                                  child: Text(
                                                    "BLUERay - 480p",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: originalSeasonDropDown &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : originalSeasonDropDown &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  )),
                                              const Text(
                                                "Bia2M",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Container(
                                                  width: width * 0.30,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "653MB",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: originalSeasonDropDown &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : originalSeasonDropDown &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.80,
                                      height: height * 0.05,
                                      padding:
                                          const EdgeInsets.only(left: 8, right: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Provider.of<MyDynamicTheme>(
                                                        context)
                                                    .isDarkMode
                                                ? Colors.black
                                                : Colors.blue),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            "Play",
                                            style: TextStyle(
                                                color: originalSeasonDropDown &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : originalSeasonDropDown &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                          Container(
                                            height: height * 0.02,
                                            width: height * 0.02,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: originalSeasonDropDown &&
                                                            Provider.of<MyDynamicTheme>(
                                                                    context)
                                                                .isDarkMode
                                                        ? Colors.black
                                                        : originalSeasonDropDown &&
                                                                Provider.of<MyDynamicTheme>(
                                                                            context)
                                                                        .isDarkMode ==
                                                                    false
                                                            ? Colors.white
                                                            : Colors.white)),
                                            child: Icon(Icons.play_arrow,
                                                size: 10,
                                                color: originalSeasonDropDown &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : originalSeasonDropDown &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    )
                                  ],
                                ),
                              ),
                              crossFadeState: originalSeasonDropDown == false
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedCrossFade(
                              firstCurve: const Interval(0.0, 0.20,
                                  curve: Curves.easeInCirc),
                              secondCurve: const Interval(0.4, 1.0,
                                  curve: Curves.fastOutSlowIn),
                              sizeCurve: Curves.bounceIn,
                              duration: const Duration(milliseconds: 400),
                              firstChild: Container(
                                height: 70,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        originalSeason2dropdown =
                                            !originalSeason2dropdown;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            width: width * 0.30,
                                            child: const Text(
                                              "BLUERay - 720p",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                        const Text(
                                          "Bia2M",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Container(
                                            width: width * 0.30,
                                            alignment: Alignment.centerRight,
                                            child: const Text(
                                              "900MB",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: Container(
                                alignment: Alignment.center,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  color: Provider.of<MyDynamicTheme>(context)
                                          .isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF0F4A5C),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            originalSeason2dropdown =
                                                !originalSeason2dropdown;
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  width: width * 0.30,
                                                  child: Text(
                                                    "BLUERay - 720p",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: originalSeason2dropdown &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : originalSeason2dropdown &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  )),
                                              const Text(
                                                "Bia2M",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Container(
                                                  width: width * 0.30,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "900MB",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: originalSeason2dropdown &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : originalSeason2dropdown &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.80,
                                      height: height * 0.05,
                                      padding:
                                          const EdgeInsets.only(left: 8, right: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Provider.of<MyDynamicTheme>(
                                                        context)
                                                    .isDarkMode
                                                ? Colors.black
                                                : Colors.blue),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            "Play",
                                            style: TextStyle(
                                                color: originalSeason2dropdown &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : originalSeason2dropdown &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                          Container(
                                            height: height * 0.02,
                                            width: height * 0.02,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: originalSeason2dropdown &&
                                                            Provider.of<MyDynamicTheme>(
                                                                    context)
                                                                .isDarkMode
                                                        ? Colors.black
                                                        : originalSeason2dropdown &&
                                                                Provider.of<MyDynamicTheme>(
                                                                            context)
                                                                        .isDarkMode ==
                                                                    false
                                                            ? Colors.white
                                                            : Colors.white)),
                                            child: Icon(Icons.play_arrow,
                                                size: 10,
                                                color: originalSeason2dropdown &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : originalSeason2dropdown &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    )
                                  ],
                                ),
                              ),
                              crossFadeState: originalSeason2dropdown == false
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedCrossFade(
                              firstCurve: const Interval(0.0, 0.20,
                                  curve: Curves.easeInCirc),
                              secondCurve: const Interval(0.4, 1.0,
                                  curve: Curves.fastOutSlowIn),
                              sizeCurve: Curves.bounceIn,
                              duration: const Duration(milliseconds: 400),
                              firstChild: Container(
                                height: 70,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        dubbedSeason1Dropdown =
                                            !dubbedSeason1Dropdown;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            width: width * 0.30,
                                            child: const Text(
                                              "BLUERay - 1080p",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                        const Text(
                                          "Bia2M",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Container(
                                            width: width * 0.30,
                                            alignment: Alignment.centerRight,
                                            child: const Text(
                                              "1700MB",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: Container(
                                alignment: Alignment.center,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  color: Provider.of<MyDynamicTheme>(context)
                                          .isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF0F4A5C),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            dubbedSeason1Dropdown =
                                                !dubbedSeason1Dropdown;
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  width: width * 0.30,
                                                  child: Text(
                                                    "BLUERay - 1080p",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: dubbedSeason1Dropdown &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : dubbedSeason1Dropdown &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  )),
                                              const Text(
                                                "Bia2M",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Container(
                                                  width: width * 0.30,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "1700MB",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: dubbedSeason1Dropdown &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : dubbedSeason1Dropdown &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.80,
                                      height: height * 0.05,
                                      padding:
                                          const EdgeInsets.only(left: 8, right: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Provider.of<MyDynamicTheme>(
                                                        context)
                                                    .isDarkMode
                                                ? Colors.black
                                                : Colors.blue),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            "Play",
                                            style: TextStyle(
                                                color: dubbedSeason1Dropdown &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : dubbedSeason1Dropdown &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                          Container(
                                            height: height * 0.02,
                                            width: height * 0.02,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: dubbedSeason1Dropdown &&
                                                            Provider.of<MyDynamicTheme>(
                                                                    context)
                                                                .isDarkMode
                                                        ? Colors.black
                                                        : dubbedSeason1Dropdown &&
                                                                Provider.of<MyDynamicTheme>(
                                                                            context)
                                                                        .isDarkMode ==
                                                                    false
                                                            ? Colors.white
                                                            : Colors.white)),
                                            child: Icon(Icons.play_arrow,
                                                size: 10,
                                                color: dubbedSeason1Dropdown &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : dubbedSeason1Dropdown &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    )
                                  ],
                                ),
                              ),
                              crossFadeState: dubbedSeason1Dropdown == false
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          ///************************************************* Dubbed Section ************************************************///
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 3.0, right: 20, top: 8),
                                child: InkWell(
                                  onTap: () {
                                    print("Dubbed");
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: themeColor
                                            ? const Color(0xFF1A2D95)
                                            : const Color(0xFF7F92F7),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15))),
                                    height: 60,
                                    width: 125,
                                    child: const Text(
                                      "Dubbed",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedCrossFade(
                              firstCurve: const Interval(0.0, 0.20,
                                  curve: Curves.easeInCirc),
                              secondCurve: const Interval(0.4, 1.0,
                                  curve: Curves.fastOutSlowIn),
                              sizeCurve: Curves.bounceIn,
                              duration: const Duration(milliseconds: 400),
                              firstChild: Container(
                                height: 70,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        dubbed1 = !dubbed1;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            width: width * 0.30,
                                            child: const Text(
                                              "BLUERay - 480p",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                        const Text(
                                          "Bia2M",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Container(
                                            width: width * 0.30,
                                            alignment: Alignment.centerRight,
                                            child: const Text(
                                              "653MB",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: Container(
                                alignment: Alignment.center,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  color: Provider.of<MyDynamicTheme>(context)
                                          .isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF0F4A5C),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            dubbed1 = !dubbed1;
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  width: width * 0.30,
                                                  child: Text(
                                                    "BLUERay - 480p",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: dubbed1 &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : dubbed1 &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  )),
                                              const Text(
                                                "Bia2M",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Container(
                                                  width: width * 0.30,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "653MB",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: dubbed1 &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : dubbed1 &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.80,
                                      height: height * 0.05,
                                      padding:
                                          const EdgeInsets.only(left: 8, right: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Provider.of<MyDynamicTheme>(
                                                        context)
                                                    .isDarkMode
                                                ? Colors.black
                                                : Colors.blue),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            "Play",
                                            style: TextStyle(
                                                color: dubbed1 &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : dubbed1 &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                          Container(
                                            height: height * 0.02,
                                            width: height * 0.02,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: dubbed1 &&
                                                            Provider.of<MyDynamicTheme>(
                                                                    context)
                                                                .isDarkMode
                                                        ? Colors.black
                                                        : dubbed1 &&
                                                                Provider.of<MyDynamicTheme>(
                                                                            context)
                                                                        .isDarkMode ==
                                                                    false
                                                            ? Colors.white
                                                            : Colors.white)),
                                            child: Icon(Icons.play_arrow,
                                                size: 10,
                                                color: dubbed1 &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : dubbed1 &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    )
                                  ],
                                ),
                              ),
                              crossFadeState: dubbed1 == false
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedCrossFade(
                              firstCurve: const Interval(0.0, 0.20,
                                  curve: Curves.easeInCirc),
                              secondCurve: const Interval(0.4, 1.0,
                                  curve: Curves.fastOutSlowIn),
                              sizeCurve: Curves.bounceIn,
                              duration: const Duration(milliseconds: 400),
                              firstChild: Container(
                                height: 70,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        dubbed2 = !dubbed2;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            width: width * 0.30,
                                            child: const Text(
                                              "BLUERay - 720p",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                        const Text(
                                          "Bia2M",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Container(
                                            width: width * 0.30,
                                            alignment: Alignment.centerRight,
                                            child: const Text(
                                              "900MB",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: Container(
                                alignment: Alignment.center,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  color: Provider.of<MyDynamicTheme>(context)
                                          .isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF0F4A5C),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            dubbed2 = !dubbed2;
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  width: width * 0.30,
                                                  child: Text(
                                                    "BLUERay - 720p",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: dubbed2 &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : dubbed2 &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  )),
                                              const Text(
                                                "Bia2M",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Container(
                                                  width: width * 0.30,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "900MB",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: dubbed2 &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : dubbed2 &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.80,
                                      height: height * 0.05,
                                      padding:
                                          const EdgeInsets.only(left: 8, right: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Provider.of<MyDynamicTheme>(
                                                        context)
                                                    .isDarkMode
                                                ? Colors.black
                                                : Colors.blue),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            "Play",
                                            style: TextStyle(
                                                color: dubbed2 &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : dubbed2 &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                          Container(
                                            height: height * 0.02,
                                            width: height * 0.02,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: dubbed2 &&
                                                            Provider.of<MyDynamicTheme>(
                                                                    context)
                                                                .isDarkMode
                                                        ? Colors.black
                                                        : dubbed2 &&
                                                                Provider.of<MyDynamicTheme>(
                                                                            context)
                                                                        .isDarkMode ==
                                                                    false
                                                            ? Colors.white
                                                            : Colors.white)),
                                            child: Icon(Icons.play_arrow,
                                                size: 10,
                                                color: dubbed2 &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : dubbed2 &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    )
                                  ],
                                ),
                              ),
                              crossFadeState: dubbed2 == false
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedCrossFade(
                              firstCurve: const Interval(0.0, 0.20,
                                  curve: Curves.easeInCirc),
                              secondCurve: const Interval(0.4, 1.0,
                                  curve: Curves.fastOutSlowIn),
                              sizeCurve: Curves.bounceIn,
                              duration: const Duration(milliseconds: 400),
                              firstChild: Container(
                                height: 70,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        dubbed3 = !dubbed3;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            width: width * 0.30,
                                            child: const Text(
                                              "BLUERay - 1080p",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                        const Text(
                                          "Bia2M",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Container(
                                            width: width * 0.30,
                                            alignment: Alignment.centerRight,
                                            child: const Text(
                                              "1700MB",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: Container(
                                alignment: Alignment.center,
                                width: width * 0.89,
                                decoration: BoxDecoration(
                                  color: Provider.of<MyDynamicTheme>(context)
                                          .isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF0F4A5C),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            dubbed3 = !dubbed3;
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  width: width * 0.30,
                                                  child: Text(
                                                    "BLUERay - 1080p",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: dubbed3 &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : dubbed3 &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  )),
                                              const Text(
                                                "Bia2M",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Container(
                                                  width: width * 0.30,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "1700MB",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: dubbed3 &&
                                                                Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                            ? Colors.black
                                                            : dubbed3 &&
                                                                    Provider.of<MyDynamicTheme>(context)
                                                                            .isDarkMode ==
                                                                        false
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.80,
                                      height: height * 0.05,
                                      padding:
                                          const EdgeInsets.only(left: 8, right: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Provider.of<MyDynamicTheme>(
                                                        context)
                                                    .isDarkMode
                                                ? Colors.black
                                                : Colors.blue),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text(
                                            "Play",
                                            style: TextStyle(
                                                color: dubbed3 &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : dubbed3 &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                          Container(
                                            height: height * 0.02,
                                            width: height * 0.02,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: dubbed3 &&
                                                            Provider.of<MyDynamicTheme>(
                                                                    context)
                                                                .isDarkMode
                                                        ? Colors.black
                                                        : dubbed3 &&
                                                                Provider.of<MyDynamicTheme>(
                                                                            context)
                                                                        .isDarkMode ==
                                                                    false
                                                            ? Colors.white
                                                            : Colors.white)),
                                            child: Icon(Icons.play_arrow,
                                                size: 10,
                                                color: dubbed3 &&
                                                        Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                    ? Colors.black
                                                    : dubbed3 &&
                                                            Provider.of<MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode ==
                                                                false
                                                        ? Colors.white
                                                        : Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    )
                                  ],
                                ),
                              ),
                              crossFadeState: dubbed3 == false
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                            ),
                          ),

                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
