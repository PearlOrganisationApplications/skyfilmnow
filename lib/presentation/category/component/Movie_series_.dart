import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../movie_screens/movie_play_and_about_section.dart';
import '../../../theme_dark_light/change_theme.dart';
import '../../../theme_dark_light/themes.dart';


class MovieSeriesThemes extends StatelessWidget {
  const MovieSeriesThemes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: MovieSeries(),
        );
      },
    );
  }
}

class MovieSeries extends StatefulWidget {
  const MovieSeries({Key? key}) : super(key: key);

  @override
  State<MovieSeries> createState() => _MovieSeriesState();
}

class _MovieSeriesState extends State<MovieSeries> {
  bool saveIcon = false;
  int? _selectedIndex;
  @override

    Widget build(BuildContext context) {

      var height  = MediaQuery.of(context).size.height;
      bool showDarkMode = Provider.of<MyDynamicTheme>(context).isDarkMode;
      var width =  MediaQuery.of(context).size.width;
      return
        MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: Provider.of<MyDynamicTheme>(context).isDarkMode
            ? setDarkTheme
            : setLightTheme,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize:  const Size.fromHeight(90.0),
            child: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:
                Provider.of<MyDynamicTheme>(context).isDarkMode
                    ? Colors.black54
                    : Colors.grey.shade500,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
              ),
              backgroundColor: Provider.of<MyDynamicTheme>(context).isDarkMode
                ? Colors.black38
                : Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Latest Movies",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontWeight: FontWeight.w600,color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.black,fontSize: 18)),
                      const SizedBox(
                        width: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:  Container(
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
                  ),
                )
              ],
            ),
          ),
          body: LayoutBuilder(

            builder: (BuildContext context, BoxConstraints constraints) =>
            ///********************************** App Bar Section ********************************///
            InkWell(
              onTap: (){
                Get.to(
                  const MoviePlayTheme(),
                );
              },
              child: Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Column(
                  children: <Widget>[

                    const Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),

                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Column(
                              children: [

                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 3.1,
                                  width: MediaQuery.of(context).size.width,

                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, ),
                                        child: Container(

                                          width: MediaQuery.of(context).size.width / 1.9,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children:   [
                                                    GestureDetector(
                                                        onTap:(){
                                                          setState(() {
                                                            _selectedIndex = index;
                                                            saveIcon = !saveIcon;
                                                            print("item saved");

                                                          });
                                                        },
                                                        child: _selectedIndex == index ?
                                                        Icon(!saveIcon ?
                                                        Icons.bookmark_border_rounded : Icons.bookmark
                                                        ) : Icon(Icons.bookmark_border_outlined)

                                                    ),

                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      "Shawshank",
                                                      style: TextStyle(
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    "Genre",
                                                    style: TextStyle(
                                                    ),
                                                  )),
                                              Padding(
                                                  padding: const EdgeInsets.only(top: 7),
                                                  child:  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children:   [
                                                      Text("VQ"),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      // SizedBox(
                                                      //   width: 5.w,
                                                      //   height: 5.h,
                                                      //   child: const Image(image: AssetImage("assets/metascore-modified.png"),fit: BoxFit.contain,),
                                                      //
                                                      // ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      const Text("AB"),
                                                      const Text("/%",style: TextStyle(color: Colors.grey),),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      // SizedBox(
                                                      //   width: 7.w,
                                                      //   height: 5.h,
                                                      //   child: const Image(image: AssetImage("assets/imdb1.jpg"),fit: BoxFit.contain,),
                                                      //
                                                      // ),

                                                    ],
                                                  )
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(top: 7),
                                                  child: Text(
                                                    "Country/language",
                                                    style: TextStyle(
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 35,
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height /
                                                8.5,
                                            width: MediaQuery.of(context).size.width ,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.grey.shade200,),
                                                color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.transparent: Colors.white,
                                                borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15))),
                                            child: Padding(
                                              padding:   EdgeInsets.only(top:10,right: constraints.maxWidth *0.15,left: 10,bottom: 10 ),
                                              child: const Center(
                                                child:   Text(
                                                  "1 hello ji 3 world",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),
                                      ),
                                      Positioned(
                                        right: -1,
                                        child: Container(
                                          height:
                                          MediaQuery.of(context).size.height /
                                              4.2,
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
                                      // Positioned(
                                      //   left: 0,
                                      //   right: 0,
                                      //   bottom: 0,
                                      //   child: Container(
                                      //
                                      //     height: height * 0.05,
                                      //     width: width,
                                      //     child: Row(
                                      //       mainAxisAlignment: MainAxisAlignment.center,
                                      //       children:   [
                                      //         Text("All the information about the serial page",style: TextStyle(color:  showDarkMode ? Colors.white : Colors.blue.shade900),textAlign: TextAlign.right,),
                                      //         const SizedBox(
                                      //           width: 5,
                                      //         ),
                                      //         Icon(Icons.add_alert_sharp,color:  showDarkMode ? Colors.white : Colors.blue.shade900,size: 18,)
                                      //       ],
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          );

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

