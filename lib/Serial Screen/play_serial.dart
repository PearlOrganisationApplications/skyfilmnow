import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfilmnow/theme_dark_light/change_theme.dart';
import 'package:skyfilmnow/theme_dark_light/themes.dart';

class PlaySerialTheme extends StatelessWidget {
  const PlaySerialTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const PlaySerial(),
        );
      },
    );
  }
}

class PlaySerial extends StatefulWidget {
  const PlaySerial({Key? key}) : super(key: key);

  @override
  State<PlaySerial> createState() => _PlaySerialState();
}

class _PlaySerialState extends State<PlaySerial> {
  bool originalSeasonDropDown = false;
  bool originalSeason2dropdown = false;
  bool dubbedSeason1Dropdown = false;
  bool dubbedSeason2Dropdown = false;
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
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
                  // //  color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black :Colors.white,
                  // // decoration: BoxDecoration(
                  // //
                  // //   borderRadius: const BorderRadius.only(
                  // //     topLeft: Radius.circular(20),
                  // //     topRight: Radius.circular(20),
                  // //   ),
                  // // ),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 10),
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      ///******************** Play Text ********************///
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Play Serial",
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
                              child: const Center(
                                child: Text(
                                  "Original Language",
                                  style: TextStyle(fontSize: 10),
                                ),
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
                              firstChild: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    originalSeasonDropDown =
                                        !originalSeasonDropDown;
                                  });
                                },
                                child: Container(
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Icon(Icons.arrow_drop_down),
                                        // IconButton(
                                        //   onPressed: () {
                                        //     setState(() {});
                                        //     originalSeasonDropDown =
                                        //         !originalSeasonDropDown;
                                        //   },
                                        //   icon: const Icon(Icons.arrow_drop_down),
                                        // ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Season 1",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.file_download_outlined)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  originalSeasonDropDown =
                                      !originalSeasonDropDown;
                                  openWebDropDown = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            IconButton(
                                              onPressed: () {
                                                setState(() {});
                                                originalSeasonDropDown =
                                                    !originalSeasonDropDown;
                                                openWebDropDown = false;
                                              },
                                              icon: const Icon(
                                                  Icons.arrow_drop_up),
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  "Season 1",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Icon(Icons
                                                    .file_download_outlined)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 3,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: AnimatedCrossFade(
                                                firstChild: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      openWebDropDown =
                                                          !openWebDropDown;
                                                      selectedIndex = index;
                                                      currentIndex = true;
                                                      print("selected index is" +
                                                          "$selectedIndex ");
                                                    });
                                                  },
                                                  child: Center(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 60,
                                                      width: 170,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        border: Border.all(
                                                            color: Provider.of<
                                                                            MyDynamicTheme>(
                                                                        context)
                                                                    .isDarkMode
                                                                ? Colors.white
                                                                : Colors.grey),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Text(
                                                              myWebText[index]
                                                                      ["pixels"]
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            const Text(
                                                              "Exclusive",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            Text(
                                                              myWebText[index]
                                                                      ["size"]
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                secondChild: Column(
                                                  children: [
                                                    Center(
                                                      child: themeColor
                                                          ? Container(
                                                              width: 200,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: selectedIndex ==
                                                                        index
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                border: Border.all(
                                                                    color: Provider.of<MyDynamicTheme>(
                                                                                context)
                                                                            .isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .grey),
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        if (selectedIndex ==
                                                                            index) {
                                                                          openWebDropDown =
                                                                              !openWebDropDown;
                                                                        }
                                                                      });
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              16,
                                                                          left:
                                                                              8,
                                                                          right:
                                                                              8,
                                                                          bottom:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            myWebText[index]["pixels"].toString(),
                                                                            style:
                                                                                TextStyle(fontSize: 10, color: selectedIndex == index ? Colors.black : Colors.white),
                                                                          ),
                                                                          const Text(
                                                                            "Exclusive",
                                                                            style:
                                                                                TextStyle(fontSize: 10, color: Colors.grey),
                                                                          ),
                                                                          Text(
                                                                            myWebText[index]["size"].toString(),
                                                                            style:
                                                                                TextStyle(fontSize: 10, color: selectedIndex == index ? Colors.black : Colors.white),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  selectedIndex ==
                                                                          index
                                                                      ? Column(
                                                                          children: [
                                                                            index == 0
                                                                                ? Padding(
                                                                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                                                                                    child: SizedBox(
                                                                                      width: width * 0.78,
                                                                                      child: GridView.builder(
                                                                                        physics: const NeverScrollableScrollPhysics(),
                                                                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.66, mainAxisSpacing: 2, crossAxisSpacing: 5),
                                                                                        itemCount: 9,
                                                                                        shrinkWrap: true,
                                                                                        itemBuilder: (BuildContext context, int index) {
                                                                                          return Column(
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.all(0.0),
                                                                                                child: Container(
                                                                                                  height: height * 0.04,
                                                                                                  alignment: Alignment.center,
                                                                                                  decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                  child: Text(
                                                                                                    "Serial ${index + 1}",
                                                                                                    style: const TextStyle(color: Colors.black),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              const SizedBox(
                                                                                                height: 2,
                                                                                                width: 2,
                                                                                              )
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                : index == 1
                                                                                    ? Padding(
                                                                                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                        child: SizedBox(
                                                                                          width: width * 0.78,
                                                                                          child: GridView.builder(
                                                                                            physics: const NeverScrollableScrollPhysics(),
                                                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                            itemCount: 9,
                                                                                            shrinkWrap: true,
                                                                                            itemBuilder: (BuildContext context, int index) {
                                                                                              return Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.all(0.0),
                                                                                                    child: Container(
                                                                                                      height: height * 0.04,
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                      child: Text(
                                                                                                        "Serial ${index + 1}",
                                                                                                        style: const TextStyle(color: Colors.black),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  const SizedBox(
                                                                                                    height: 2,
                                                                                                    width: 2,
                                                                                                  )
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    : Padding(
                                                                                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                        child: SizedBox(
                                                                                          width: width * 0.78,
                                                                                          child: GridView.builder(
                                                                                            physics: const NeverScrollableScrollPhysics(),
                                                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.66, mainAxisSpacing: 2, crossAxisSpacing: 5),
                                                                                            itemCount: 9,
                                                                                            shrinkWrap: true,
                                                                                            itemBuilder: (BuildContext context, int index) {
                                                                                              return Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.all(0.0),
                                                                                                    child: Container(
                                                                                                      height: height * 0.04,
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                      child: Text(
                                                                                                        "Serial ${index + 1}",
                                                                                                        style: const TextStyle(color: Colors.black),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  const SizedBox(
                                                                                                    height: 2,
                                                                                                    width: 2,
                                                                                                  )
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            )
                                                                          ],
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              ),
                                                            )
                                                          : Container(
                                                              width: width * 10,
                                                              // width: 400,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: selectedIndex ==
                                                                        index
                                                                    ? const Color(
                                                                        0xFF0F4A5C)
                                                                    : Colors
                                                                        .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                border: Border.all(
                                                                    color: Provider.of<MyDynamicTheme>(
                                                                                context)
                                                                            .isDarkMode
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .grey),
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        if (selectedIndex ==
                                                                            index) {
                                                                          openWebDropDown =
                                                                              !openWebDropDown;
                                                                        }
                                                                      });
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              16,
                                                                          left:
                                                                              8,
                                                                          right:
                                                                              8,
                                                                          bottom:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            myWebText[index]["pixels"].toString(),
                                                                            style:
                                                                                TextStyle(fontSize: 10, color: selectedIndex == index ? Colors.white : Colors.black),
                                                                          ),
                                                                          const Text(
                                                                            "Exclusive",
                                                                            style:
                                                                                TextStyle(fontSize: 10, color: Colors.grey),
                                                                          ),
                                                                          Text(
                                                                            myWebText[index]["size"].toString(),
                                                                            style:
                                                                                TextStyle(fontSize: 10, color: selectedIndex == index ? Colors.white : Colors.black),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  selectedIndex ==
                                                                          index
                                                                      ? Column(
                                                                          children: [
                                                                            index == 0
                                                                                ? Padding(
                                                                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                    child: SizedBox(
                                                                                      width: width * 0.78,
                                                                                      child: GridView.builder(
                                                                                        physics: const NeverScrollableScrollPhysics(),
                                                                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.64, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                        itemCount: 5,
                                                                                        shrinkWrap: true,
                                                                                        itemBuilder: (BuildContext context, int index) {
                                                                                          return Column(
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.all(0.0),
                                                                                                child: Container(
                                                                                                  height: height * 0.04,
                                                                                                  alignment: Alignment.center,
                                                                                                  decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                  child: Text(
                                                                                                    "Serial ${index + 1}",
                                                                                                    style: const TextStyle(color: Colors.white),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              const SizedBox(
                                                                                                height: 20,
                                                                                                width: 20,
                                                                                              )
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                : index == 1
                                                                                    ? Padding(
                                                                                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                        child: SizedBox(
                                                                                          width: width * 0.78,
                                                                                          child: GridView.builder(
                                                                                            physics: const NeverScrollableScrollPhysics(),
                                                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.64, mainAxisSpacing: 2, crossAxisSpacing: 5),
                                                                                            itemCount: 9,
                                                                                            shrinkWrap: true,
                                                                                            itemBuilder: (BuildContext context, int index) {
                                                                                              return Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.all(0.0),
                                                                                                    child: Container(
                                                                                                      height: height * 0.04,
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                      child: Text(
                                                                                                        "Serial ${index + 1}",
                                                                                                        style: const TextStyle(color: Colors.white),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  const SizedBox(
                                                                                                    height: 20,
                                                                                                    width: 20,
                                                                                                  )
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    : Padding(
                                                                                        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                        child: SizedBox(
                                                                                          width: width * 0.78,
                                                                                          child: GridView.builder(
                                                                                            physics: const NeverScrollableScrollPhysics(),
                                                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                              crossAxisCount: 2,
                                                                                              childAspectRatio: 2.64,
                                                                                              mainAxisSpacing: 2,
                                                                                              crossAxisSpacing: 5,
                                                                                            ),
                                                                                            itemCount: 9,
                                                                                            shrinkWrap: true,
                                                                                            itemBuilder: (BuildContext context, int index) {
                                                                                              return Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.all(0.0),
                                                                                                    child: Container(
                                                                                                      height: height * 0.04,
                                                                                                      alignment: Alignment.center,
                                                                                                      decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                      child: Text(
                                                                                                        "Serial ${index + 1}",
                                                                                                        style: const TextStyle(color: Colors.white),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  const SizedBox(
                                                                                                    height: 20,
                                                                                                    width: 20,
                                                                                                  )
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            )
                                                                          ],
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              ),
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                crossFadeState:
                                                    openWebDropDown == false
                                                        ? CrossFadeState
                                                            .showFirst
                                                        : CrossFadeState
                                                            .showSecond,
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
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
                              firstChild: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  originalSeason2dropdown =
                                      !originalSeason2dropdown;
                                },
                                child: Container(
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Icon(Icons.arrow_drop_down),
                                        Row(
                                          children: const [
                                            Text(
                                              "Season 2",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.file_download_outlined)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  originalSeason2dropdown =
                                      !originalSeason2dropdown;
                                  openWeb2DropDown = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            const Icon(Icons.arrow_drop_up),
                                            Row(
                                              children: const [
                                                Text(
                                                  "Season 2",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 80,
                                                ),
                                                Icon(Icons
                                                    .file_download_outlined)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 3,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: AnimatedCrossFade(
                                                  firstChild: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        openWeb2DropDown =
                                                            !openWeb2DropDown;
                                                        selectedIndex2 = index;

                                                        print("selected index is" +
                                                            "$selectedIndex2 ");
                                                      });
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 60,
                                                        width: 156,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                              color: Provider.of<
                                                                              MyDynamicTheme>(
                                                                          context)
                                                                      .isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .grey),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                myWebText[index]
                                                                        [
                                                                        "pixels"]
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                              const Text(
                                                                "Exclusive",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              Text(
                                                                myWebText[index]
                                                                        ["size"]
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  secondChild: Column(
                                                    children: [
                                                      Center(
                                                        child: themeColor
                                                            ? Container(
                                                                width: 200,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: selectedIndex2 ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  border: Border.all(
                                                                      color: Provider.of<MyDynamicTheme>(context).isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .grey),
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (selectedIndex2 ==
                                                                              index) {
                                                                            openWeb2DropDown =
                                                                                !openWeb2DropDown;
                                                                          }
                                                                        });
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                16,
                                                                            left:
                                                                                8,
                                                                            right:
                                                                                8,
                                                                            bottom:
                                                                                8),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Text(
                                                                              myWebText[index]["pixels"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex2 == index ? Colors.black : Colors.white),
                                                                            ),
                                                                            const Text(
                                                                              "Exclusive",
                                                                              style: TextStyle(fontSize: 10, color: Colors.grey),
                                                                            ),
                                                                            Text(
                                                                              myWebText[index]["size"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex2 == index ? Colors.black : Colors.white),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    selectedIndex2 ==
                                                                            index
                                                                        ? Column(
                                                                            children: [
                                                                              index == 0
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                      child: SizedBox(
                                                                                        width: width * 0.78,
                                                                                        child: GridView.builder(
                                                                                          physics: const NeverScrollableScrollPhysics(),
                                                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.00, mainAxisSpacing: 2, crossAxisSpacing: 5),
                                                                                          itemCount: 9,
                                                                                          shrinkWrap: true,
                                                                                          itemBuilder: (BuildContext context, int index) {
                                                                                            return Column(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.all(0.0),
                                                                                                  child: Container(
                                                                                                    height: height * 0.04,
                                                                                                    alignment: Alignment.center,
                                                                                                    decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                    child: Text(
                                                                                                      "Serial ${index + 1}",
                                                                                                      style: const TextStyle(color: Colors.black),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                const SizedBox(
                                                                                                  height: 2,
                                                                                                  width: 2,
                                                                                                )
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : index == 1
                                                                                      ? Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.black),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      : Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.black),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                              const SizedBox(
                                                                                height: 78,
                                                                              )
                                                                            ],
                                                                          )
                                                                        : Container(),
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(
                                                                width:
                                                                    width * 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: selectedIndex2 ==
                                                                          index
                                                                      ? const Color(
                                                                          0xFF0F4A5C)
                                                                      : Colors
                                                                          .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  border: Border.all(
                                                                      color: Provider.of<MyDynamicTheme>(context).isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .grey),
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (selectedIndex2 ==
                                                                              index) {
                                                                            openWeb2DropDown =
                                                                                !openWeb2DropDown;
                                                                          }
                                                                        });
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                20,
                                                                            left:
                                                                                8,
                                                                            right:
                                                                                8,
                                                                            bottom:
                                                                                10),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Text(
                                                                              myWebText[index]["pixels"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex2 == index ? Colors.white : Colors.black),
                                                                            ),
                                                                            const Text(
                                                                              "Exclusive",
                                                                              style: TextStyle(fontSize: 10, color: Colors.grey),
                                                                            ),
                                                                            Text(
                                                                              myWebText[index]["size"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex2 == index ? Colors.white : Colors.black),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    selectedIndex2 ==
                                                                            index
                                                                        ? Column(
                                                                            children: [
                                                                              index == 0
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                      child: SizedBox(
                                                                                        width: width * 0.78,
                                                                                        child: GridView.builder(
                                                                                          physics: const NeverScrollableScrollPhysics(),
                                                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                          itemCount: 9,
                                                                                          shrinkWrap: true,
                                                                                          itemBuilder: (BuildContext context, int index) {
                                                                                            return Column(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.all(0.0),
                                                                                                  child: Container(
                                                                                                    height: height * 0.04,
                                                                                                    alignment: Alignment.center,
                                                                                                    decoration: BoxDecoration(
                                                                                                      border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue),
                                                                                                      color: Colors.transparent,
                                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                                    ),
                                                                                                    child: Text(
                                                                                                      "Serial ${index + 1}",
                                                                                                      style: const TextStyle(color: Colors.white),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                const SizedBox(
                                                                                                  height: 2,
                                                                                                  width: 2,
                                                                                                )
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : index == 1
                                                                                      ? Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.white),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      : Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.white),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              )
                                                                            ],
                                                                          )
                                                                        : Container(),
                                                                  ],
                                                                ),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 400),
                                                  crossFadeState:
                                                      openWeb2DropDown == false
                                                          ? CrossFadeState
                                                              .showFirst
                                                          : CrossFadeState
                                                              .showSecond,
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              crossFadeState: originalSeason2dropdown == false
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
                              firstChild: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  dubbedSeason1Dropdown =
                                      !dubbedSeason1Dropdown;
                                },
                                child: Container(
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Icon(Icons.arrow_drop_down),
                                        Row(
                                          children: const [
                                            Text(
                                              "Season 1",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.file_download_outlined)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  dubbedSeason1Dropdown =
                                      !dubbedSeason1Dropdown;
                                  openWeb3DropDown = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            const Icon(Icons.arrow_drop_up),
                                            Row(
                                              children: const [
                                                Text(
                                                  "Season 1",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Icon(Icons
                                                    .file_download_outlined)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 3,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: AnimatedCrossFade(
                                                  firstChild: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        openWeb3DropDown =
                                                            !openWeb3DropDown;
                                                        selectedIndex3 = index;
                                                        currentIndex = true;
                                                        print("selected index is" +
                                                            "$selectedIndex ");
                                                      });
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 60,
                                                        width: 156,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                              color: Provider.of<
                                                                              MyDynamicTheme>(
                                                                          context)
                                                                      .isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .grey),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                myWebText[index]
                                                                        [
                                                                        "pixels"]
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                              const Text(
                                                                "Exclusive",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              Text(
                                                                myWebText[index]
                                                                        ["size"]
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  secondChild: Column(
                                                    children: [
                                                      Center(
                                                        child: themeColor
                                                            ? Container(
                                                                width: 200,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: selectedIndex3 ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  border: Border.all(
                                                                      color: Provider.of<MyDynamicTheme>(context).isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .grey),
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (selectedIndex3 ==
                                                                              index) {
                                                                            openWeb3DropDown =
                                                                                !openWeb3DropDown;
                                                                          }
                                                                        });
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                16,
                                                                            left:
                                                                                8,
                                                                            right:
                                                                                8,
                                                                            bottom:
                                                                                10),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Text(
                                                                              myWebText[index]["pixels"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex3 == index ? Colors.black : Colors.white),
                                                                            ),
                                                                            const Text(
                                                                              "Exclusive",
                                                                              style: TextStyle(fontSize: 10, color: Colors.grey),
                                                                            ),
                                                                            Text(
                                                                              myWebText[index]["size"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex3 == index ? Colors.black : Colors.white),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    selectedIndex3 ==
                                                                            index
                                                                        ? Column(
                                                                            children: [
                                                                              index == 0
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                      child: SizedBox(
                                                                                        width: width * 0.78,
                                                                                        child: GridView.builder(
                                                                                          physics: const NeverScrollableScrollPhysics(),
                                                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                            crossAxisCount: 2,
                                                                                            childAspectRatio: 2.66,
                                                                                            mainAxisSpacing: 0,
                                                                                            crossAxisSpacing: 5,
                                                                                          ),
                                                                                          itemCount: 9,
                                                                                          shrinkWrap: true,
                                                                                          itemBuilder: (BuildContext context, int index) {
                                                                                            return Column(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.all(0.0),
                                                                                                  child: Container(
                                                                                                    height: height * 0.04,
                                                                                                    alignment: Alignment.center,
                                                                                                    decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                    child: Text(
                                                                                                      "Serial ${index + 1}",
                                                                                                      style: const TextStyle(color: Colors.black),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                const SizedBox(
                                                                                                  height: 2,
                                                                                                  width: 2,
                                                                                                )
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : index == 1
                                                                                      ? Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                crossAxisCount: 2,
                                                                                                childAspectRatio: 2.66,
                                                                                                mainAxisSpacing: 0,
                                                                                                crossAxisSpacing: 5,
                                                                                              ),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.black),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      : Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                crossAxisCount: 2,
                                                                                                childAspectRatio: 2.66,
                                                                                                mainAxisSpacing: 0,
                                                                                                crossAxisSpacing: 5,
                                                                                              ),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.black),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              )
                                                                            ],
                                                                          )
                                                                        : Container(),
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(
                                                                width:
                                                                    width * 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: selectedIndex3 ==
                                                                          index
                                                                      ? const Color(
                                                                          0xFF0F4A5C)
                                                                      : Colors
                                                                          .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  border: Border.all(
                                                                      color: Provider.of<MyDynamicTheme>(context).isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .grey),
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (selectedIndex3 ==
                                                                              index) {
                                                                            openWeb3DropDown =
                                                                                !openWeb3DropDown;
                                                                          }
                                                                        });
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                16,
                                                                            left:
                                                                                8,
                                                                            right:
                                                                                8,
                                                                            bottom:
                                                                                10),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Text(
                                                                              myWebText[index]["pixels"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex3 == index ? Colors.white : Colors.black),
                                                                            ),
                                                                            const Text(
                                                                              "Exclusive",
                                                                              style: TextStyle(fontSize: 10, color: Colors.grey),
                                                                            ),
                                                                            Text(
                                                                              myWebText[index]["size"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex3 == index ? Colors.white : Colors.black),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    selectedIndex3 ==
                                                                            index
                                                                        ? Column(
                                                                            children: [
                                                                              index == 0
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                      child: SizedBox(
                                                                                        width: width * 0.78,
                                                                                        child: GridView.builder(
                                                                                          physics: const NeverScrollableScrollPhysics(),
                                                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                          itemCount: 9,
                                                                                          shrinkWrap: true,
                                                                                          itemBuilder: (BuildContext context, int index) {
                                                                                            return Column(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.all(0.0),
                                                                                                  child: Container(
                                                                                                    height: height * 0.04,
                                                                                                    alignment: Alignment.center,
                                                                                                    decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                    child: Text(
                                                                                                      "Serial ${index + 1}",
                                                                                                      style: const TextStyle(color: Colors.white),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                const SizedBox(
                                                                                                  height: 2,
                                                                                                  width: 2,
                                                                                                )
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : index == 1
                                                                                      ? Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.white),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      : Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.white),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              )
                                                                            ],
                                                                          )
                                                                        : Container(),
                                                                  ],
                                                                ),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 400),
                                                  crossFadeState:
                                                      openWeb3DropDown == false
                                                          ? CrossFadeState
                                                              .showFirst
                                                          : CrossFadeState
                                                              .showSecond,
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              crossFadeState: dubbedSeason1Dropdown == false
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
                              firstChild: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  dubbedSeason2Dropdown =
                                      !dubbedSeason2Dropdown;
                                },
                                child: Container(
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Icon(Icons.arrow_drop_down),
                                        Row(
                                          children: const [
                                            Text(
                                              "Season 2",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.file_download_outlined)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              secondChild: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  dubbedSeason2Dropdown =
                                      !dubbedSeason2Dropdown;
                                  openWeb4DropDown = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            const Icon(Icons.arrow_drop_up),
                                            Row(
                                              children: const [
                                                Text(
                                                  "Season 2",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Icon(Icons
                                                    .file_download_outlined)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 3,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: AnimatedCrossFade(
                                                  firstChild: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        openWeb4DropDown =
                                                            !openWeb4DropDown;
                                                        selectedIndex4 = index;
                                                        currentIndex = true;
                                                        print("selected index is" +
                                                            "$selectedIndex4 ");
                                                      });
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 60,
                                                        width: 156,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                              color: Provider.of<
                                                                              MyDynamicTheme>(
                                                                          context)
                                                                      .isDarkMode
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .grey),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                myWebText[index]
                                                                        [
                                                                        "pixels"]
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                              const Text(
                                                                "Exclusive",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              Text(
                                                                myWebText[index]
                                                                        ["size"]
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  secondChild: Column(
                                                    children: [
                                                      Center(
                                                        child: themeColor
                                                            ? Container(
                                                                width: 200,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: selectedIndex4 ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  border: Border.all(
                                                                      color: Provider.of<MyDynamicTheme>(context).isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .grey),
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (selectedIndex4 ==
                                                                              index) {
                                                                            openWeb4DropDown =
                                                                                !openWeb4DropDown;
                                                                          }
                                                                        });
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                16,
                                                                            left:
                                                                                8,
                                                                            right:
                                                                                8,
                                                                            bottom:
                                                                                10),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Text(
                                                                              myWebText[index]["pixels"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex4 == index ? Colors.black : Colors.white),
                                                                            ),
                                                                            const Text(
                                                                              "Exclusive",
                                                                              style: TextStyle(fontSize: 10, color: Colors.grey),
                                                                            ),
                                                                            Text(
                                                                              myWebText[index]["size"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex4 == index ? Colors.black : Colors.white),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    selectedIndex4 ==
                                                                            index
                                                                        ? Column(
                                                                            children: [
                                                                              index == 0
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                      child: SizedBox(
                                                                                        width: width * 0.78,
                                                                                        child: GridView.builder(
                                                                                          physics: const NeverScrollableScrollPhysics(),
                                                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                          itemCount: 9,
                                                                                          shrinkWrap: true,
                                                                                          itemBuilder: (BuildContext context, int index) {
                                                                                            return Column(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.all(0.0),
                                                                                                  child: Container(
                                                                                                    height: height * 0.04,
                                                                                                    alignment: Alignment.center,
                                                                                                    decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                    child: Text(
                                                                                                      "Serial ${index + 1}",
                                                                                                      style: const TextStyle(color: Colors.black),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                const SizedBox(
                                                                                                  height: 2,
                                                                                                  width: 2,
                                                                                                )
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : index == 1
                                                                                      ? Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.black),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      : Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.66, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.black),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              )
                                                                            ],
                                                                          )
                                                                        : Container(),
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(
                                                                width:
                                                                    width * 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: selectedIndex4 ==
                                                                          index
                                                                      ? const Color(
                                                                          0xFF0F4A5C)
                                                                      : Colors
                                                                          .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  border: Border.all(
                                                                      color: Provider.of<MyDynamicTheme>(context).isDarkMode
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .grey),
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (selectedIndex4 ==
                                                                              index) {
                                                                            openWeb4DropDown =
                                                                                !openWeb4DropDown;
                                                                          }
                                                                        });
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                16,
                                                                            left:
                                                                                8,
                                                                            right:
                                                                                8,
                                                                            bottom:
                                                                                10),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            Text(
                                                                              myWebText[index]["pixels"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex4 == index ? Colors.white : Colors.black),
                                                                            ),
                                                                            const Text(
                                                                              "Exclusive",
                                                                              style: TextStyle(fontSize: 10, color: Colors.grey),
                                                                            ),
                                                                            Text(
                                                                              myWebText[index]["size"].toString(),
                                                                              style: TextStyle(fontSize: 10, color: selectedIndex4 == index ? Colors.white : Colors.black),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    selectedIndex4 ==
                                                                            index
                                                                        ? Column(
                                                                            children: [
                                                                              index == 0
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                      child: SizedBox(
                                                                                        width: width * 0.78,
                                                                                        child: GridView.builder(
                                                                                          physics: const NeverScrollableScrollPhysics(),
                                                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                            crossAxisCount: 2,
                                                                                            childAspectRatio: 2.64,
                                                                                            mainAxisSpacing: 1,
                                                                                            crossAxisSpacing: 5,
                                                                                          ),
                                                                                          itemCount: 9,
                                                                                          shrinkWrap: true,
                                                                                          itemBuilder: (BuildContext context, int index) {
                                                                                            return Column(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.all(0.0),
                                                                                                  child: Container(
                                                                                                    height: height * 0.04,
                                                                                                    alignment: Alignment.center,
                                                                                                    decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                    child: Text(
                                                                                                      "Serial ${index + 1}",
                                                                                                      style: const TextStyle(color: Colors.white),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                const SizedBox(
                                                                                                  height: 20,
                                                                                                  width: 20,
                                                                                                )
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : index == 1
                                                                                      ? Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.64, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.white),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      : Padding(
                                                                                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                                          child: SizedBox(
                                                                                            width: width * 0.78,
                                                                                            child: GridView.builder(
                                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.64, mainAxisSpacing: 0, crossAxisSpacing: 5),
                                                                                              itemCount: 9,
                                                                                              shrinkWrap: true,
                                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                                return Column(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(0.0),
                                                                                                      child: Container(
                                                                                                        height: height * 0.04,
                                                                                                        alignment: Alignment.center,
                                                                                                        decoration: BoxDecoration(border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.blue), color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                                                                                                        child: Text(
                                                                                                          "Serial ${index + 1}",
                                                                                                          style: const TextStyle(color: Colors.white),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const SizedBox(
                                                                                                      height: 2,
                                                                                                      width: 2,
                                                                                                    )
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              )
                                                                            ],
                                                                          )
                                                                        : Container(),
                                                                  ],
                                                                ),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 400),
                                                  crossFadeState:
                                                      openWeb4DropDown == false
                                                          ? CrossFadeState
                                                              .showFirst
                                                          : CrossFadeState
                                                              .showSecond,
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              crossFadeState: dubbedSeason2Dropdown == false
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

///*********** Costume Movie Info ***********///
// Widget aboutMovieInfo(
//   BuildContext context,
// ) {
//   bool originalSeasonDropDown = false;
//   return Container(
//     height: MediaQuery.of(context).size.height,
//     color: Provider.of<MyDynamicTheme>(context).isDarkMode
//         ? Colors.black
//         : Colors.white,
//     decoration: const BoxDecoration(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//       ),
//     ),
//     child: ListView(
//       padding: const EdgeInsets.only(top: 10),
//       scrollDirection: Axis.vertical,
//       children: <Widget>[
//         ///******************** Play Text ********************///
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "Play Movie",
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             ///********************* Original Language Button **********************///
//             Padding(
//               padding: const EdgeInsets.only(bottom: 3.0, right: 20, top: 20),
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: const BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.all(Radius.circular(15))),
//                 height: 6,
//                 width: 40,
//                 child: Text(
//                   "Original Language",
//                   style: TextStyle(fontSize: 10.sp),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   originalSeasonDropDown = !originalSeasonDropDown;
//                 },
//                 onTapCancel: () => originalSeasonDropDown == false,
//                 child: originalSeasonDropDown
//                     ? Container(
//                         height: 7,
//                         width: 89,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(
//                               color: Provider.of<MyDynamicTheme>(context)
//                                       .isDarkMode
//                                   ? Colors.white
//                                   : Colors.grey),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               const Icon(Icons.arrow_drop_down),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Season 1",
//                                     style: TextStyle(
//                                         fontSize: 13.sp,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   const Icon(Icons.file_download_outlined)
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     : Container(
//                         height: 30,
//                       ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(3.0),
//               child: Container(
//                 height: 8.h,
//                 width: 89.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                       color: Provider.of<MyDynamicTheme>(context).isDarkMode
//                           ? Colors.white
//                           : Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "WEBRip -1080p",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "YIFY",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "2464MB",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//         Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 8.h,
//                 width: 89.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                       color: Provider.of<MyDynamicTheme>(context).isDarkMode
//                           ? Colors.white
//                           : Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "WEBRip -720p",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "YIFY",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "1198MB",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(3.0),
//               child: Container(
//                 height: 8.h,
//                 width: 89.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                       color: Provider.of<MyDynamicTheme>(context).isDarkMode
//                           ? Colors.white
//                           : Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "WEBRip -1080p",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "YIFY",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "2464MB",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             ///************************************************* Dubbed Section ************************************************///
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 3.0, right: 20, top: 8),
//                   child: InkWell(
//                     onTap: () {
//                       print("Dubbed");
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           color: Colors.lightBlue.shade800,
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(15))),
//                       height: 6.h,
//                       width: 25.w,
//                       child: Text(
//                         "Dubbed",
//                         style: TextStyle(fontSize: 10.sp),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 height: 8.h,
//                 width: 89.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                       color: Provider.of<MyDynamicTheme>(context).isDarkMode
//                           ? Colors.white
//                           : Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "WEBRip -1080p",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "YIFY",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "2464MB",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 8.h,
//                 width: 89.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                       color: Provider.of<MyDynamicTheme>(context).isDarkMode
//                           ? Colors.white
//                           : Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "WEBRip -1080p",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "YIFY",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "2464MB",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 8.h,
//                 width: 89.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                       color: Provider.of<MyDynamicTheme>(context).isDarkMode
//                           ? Colors.white
//                           : Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "WEBRip -1080p",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "YIFY",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                       Text(
//                         "2464MB",
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             )
//           ],
//         ),
//       ],
//     ),
