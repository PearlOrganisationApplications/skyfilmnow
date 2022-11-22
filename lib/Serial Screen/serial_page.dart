import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:skyfilmnow/Serial%20Screen/play_serial.dart';
import 'package:skyfilmnow/Serial%20Screen/serial_about_play_screen.dart';
import 'package:skyfilmnow/presentation/category/component/category_initial_screen.dart';
import 'package:skyfilmnow/theme_dark_light/change_theme.dart';
import 'package:skyfilmnow/theme_dark_light/themes.dart';

import '../movie_screens/movie_play_and_about_section.dart';
import '../presentation/category/component/movie_in_category.dart';

var globalContext;

class SerialPageTheme extends StatelessWidget {
  const SerialPageTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const SerialPage(),
        );
      },
    );
  }
}

class SerialPage extends StatefulWidget {
  const SerialPage({Key? key}) : super(key: key);

  @override
  State<SerialPage> createState() => _SerialPageState();
}

class _SerialPageState extends State<SerialPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Provider.of<MyDynamicTheme>(context).isDarkMode
              ? Colors.black
              : Colors.white,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Text(
                    "Serials",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Provider.of<MyDynamicTheme>(context).isDarkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    width: 50,
                    height: 50,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        print("Back To Category");
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Provider.of<MyDynamicTheme>(context).isDarkMode
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>

              ///********************************** App Bar Section ********************************///
              Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 2),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 3.2,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.9,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [
                                                Icon(
                                                  Icons.bookmark_border_rounded,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Shawshank",
                                                  style: TextStyle(),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Genre",
                                                style: TextStyle(),
                                              )),
                                          const Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Rating",
                                                style: TextStyle(),
                                              )),
                                          const Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Country/language",
                                                style: TextStyle(),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6.5,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Provider.of<MyDynamicTheme>(
                                                              context)
                                                          .isDarkMode
                                                      ? Colors.white
                                                      : Colors.grey.shade200,
                                            ),
                                            color: Provider.of<MyDynamicTheme>(
                                                        context)
                                                    .isDarkMode
                                                ? Colors.transparent
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15))),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              right:
                                                  constraints.maxWidth * 0.38,
                                              left: 10,
                                              bottom: 10),
                                          child: Container(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "dfjidjfgidjfefkleflefgkgfgdklfndklfdlfngvkdgnldkdkl;dghlghk;fg;gidjijhyuyuyud",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          )),
                                        )),
                                  ),
                                  Positioned(
                                    right: -1,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             PlaySerial()));
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SerialPlayTheme(),),);
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3.8,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.8,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/shawshank.png",
                                                ),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      );
                      //   Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: <Widget>[
                      //     /// ****************************** Title Section **********************************///
                      //     Row(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: <Widget>[
                      //         const Icon(
                      //           Icons.bookmark_border_rounded,
                      //           color: Colors.black,
                      //         ),
                      //         SizedBox(width: 5.w),
                      //         Text(
                      //           "Shanhwak",
                      //           style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      //         ),
                      //
                      //         ///********************* Movie Card Section *********************///
                      //         Row(
                      //            mainAxisAlignment: MainAxisAlignment.start,
                      //           children: <Widget>[
                      //             Column(
                      //               children: [
                      //                 Row(
                      //                   // mainAxisAlignment: MainAxisAlignment.start,
                      //                   children: [
                      //                     Text("data"),
                      //
                      //                     Text("data"),
                      //                     // Text("Heelo"),
                      //                   ],
                      //                 ),
                      //                 Text("Rating"),
                      //                 Text("Country/Language"),
                      //                 Text("Story"),
                      //                 Text("Dubbed"),
                      //               ],
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.only(right: 6.0),
                      //               child: Container(
                      //                 width: 40.w,
                      //                 height: 30.h,
                      //                 decoration: BoxDecoration(
                      //                   image: const DecorationImage(
                      //                       image: AssetImage(
                      //                           "assets/shawshank.png"),
                      //                       fit: BoxFit.cover),
                      //                   borderRadius:
                      //                       BorderRadius.circular(20),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //
                      //     ///*************************************** Story Section ********************************///
                      //     Padding(
                      //       padding: EdgeInsets.only(right: 8.0.w, bottom: 1),
                      //       child: Container(
                      //         margin: const EdgeInsets.only(left: 20),
                      //         width: 100.w,
                      //         decoration: const BoxDecoration(
                      //           color: Colors.blueGrey,
                      //           borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(20),
                      //             bottomLeft: Radius.circular(20),
                      //             topRight: Radius.circular(20),
                      //             bottomRight: Radius.circular(20),
                      //           ),
                      //         ),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: <Widget>[
                      //             // SizedBox(width: 12.w),
                      //             Container(
                      //               width: 40.w,
                      //               height: 12.h,
                      //               child: Text(
                      //                 "Lorem Ipsum refers to a Lorem ipsum resembles Latin \nbut has no real meaning.",
                      //                 textAlign: TextAlign.right,
                      //                 maxLines: 4,
                      //                 overflow: TextOverflow.clip,
                      //                 style: TextStyle(fontSize: 12.sp),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(height: 8.h),
                      //   ],
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
