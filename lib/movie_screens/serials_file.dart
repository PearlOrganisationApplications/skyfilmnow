
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../theme_dark_light/change_theme.dart';
import '../theme_dark_light/themes.dart';

class GenreThemeClass extends StatelessWidget {
  const GenreThemeClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const GenreClass(),
        );
      },
    );
  }
}


class GenreClass extends StatefulWidget {

  const GenreClass({Key? key}) : super(key: key);

  @override
  State<GenreClass> createState() => _GenreClassState();
}

class _GenreClassState extends State<GenreClass> {
  @override
  Widget build(BuildContext context) {
    var height  = MediaQuery.of(context).size.height;
    bool showDarkMode = Provider.of<MyDynamicTheme>(context).isDarkMode;
    var width =  MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize (
            preferredSize: const Size.fromHeight(90.0),
            child: AppBar(

              backgroundColor:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.grey.shade900 : Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("WatchList",
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
                  ),
                )
              ],
            ),
          ),
          body:    LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
            ///********************************** App Bar Section ********************************///
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),

                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            children: [
                              index == 0 ? SizedBox(
                                height: height * 0.05,
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text("All the information about the serial page",style: TextStyle(color: Colors.grey),textAlign: TextAlign.right,),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.info_outline,color: Colors.grey,)
                                  ],
                                ),
                              ) : Container(),
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
                                                children: const [
                                                  Icon(
                                                    Icons.bookmark_border_rounded,

                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
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
                                                    SizedBox(
                                                      width: 5,
                                                      height: 5,
                                                      child: const Image(image: AssetImage("assets/metascore-modified.png"),fit: BoxFit.contain,),

                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    const Text("AB"),
                                                    const Text("/%",style: TextStyle(color: Colors.grey),),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    SizedBox(
                                                      width: 7.w,
                                                      height: 5.w,
                                                      child: const Image(image: AssetImage("assets/imdb1.jpg"),fit: BoxFit.contain,),

                                                    ),

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
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(

                                        height: height * 0.05,
                                        width: width,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:   [
                                            const Text("All the information about the serial page",style: TextStyle(color: Colors.grey),textAlign: TextAlign.right,),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Icon(Icons.add_alert_sharp,color:  showDarkMode ? Colors.white : Colors.grey.shade800,size: 18,)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
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
