

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../theme_dark_light/change_theme.dart';
import '../../theme_dark_light/themes.dart';
int indicatorOnTap = 0;
class WatchListTheme extends StatelessWidget {
  const WatchListTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const WatchList(),
        );
      },
    );
  }
}


class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> with TickerProviderStateMixin {

  TabController? _tabController;

  bool saveTheIcon = false;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _tabController =   TabController(length: 2, vsync:this);
    _tabController?.addListener(() {_handleTabSelection();});
  }
  void _handleTabSelection() {
    setState(() {
      indicatorOnTap = _tabController!.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height  = MediaQuery.of(context).size.height;

    var width =  MediaQuery.of(context).size.width;
    bool showDarkMode = Provider.of<MyDynamicTheme>(context).isDarkMode;
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
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: showDarkMode ? Colors.white : Colors.blue.shade900,
                unselectedLabelColor: Colors.grey  ,
             tabs: const [
               Tab(child: Text("Serials", )),
               Tab(child:  Text("Movies", ) ),
             ],

                onTap: (index){

                  indicatorOnTap = index;
                  print(indicatorOnTap);
                },
              ),
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
          body: TabBarView(
            controller: _tabController,
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) =>
                ///********************************** App Bar Section ********************************///
                Container(
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
                                  index == 0 ? SizedBox(
                                    height: height * 0.05,
                                    width: width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text("All the information about the serial page",
                                          style: TextStyle(color: Colors.grey),textAlign: TextAlign.right,),
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
                                                    children: [
                                                      GestureDetector(
                                                          onTap:(){
                                                            setState(() {
                                                              selectedIndex = index;
                                                              print("selectedIndex is " + "$selectedIndex" );
                                                              saveTheIcon = !saveTheIcon;
                                                              print("saveIcon is " + "$saveTheIcon" );
                                                              print("item saved");
                                                            });
                                                          },
                                                          child: selectedIndex == index ?
                                                          Icon(!saveTheIcon ?
                                                          Icons.bookmark_border_rounded : Icons.bookmark
                                                          ) : const Icon(Icons.bookmark_border_outlined)

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
                                                      children:   const [
                                                        Text("VQ"),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                          height: 15,
                                                          child: Image(image: AssetImage("assets/metascore-modified.png"),fit: BoxFit.contain,),

                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text("AB"),
                                                        Text("/%",style: TextStyle(color: Colors.grey),),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                          height: 15,
                                                          child: Image(image: AssetImage("assets/imdb1.jpg"),fit: BoxFit.contain,),

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
                                                  12.0,
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
                                                5.1,
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
              )  ,
              LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
    ///********************************** App Bar Section ********************************///
                 Container(

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
                      index == 0 ?
                      SizedBox(
                        height: height * 0.05,
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("All the information about the Movie page",
                              style: TextStyle(color: Colors.grey),textAlign: TextAlign.right,),
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
                                        children:  [
                                          GestureDetector(
                                              onTap:(){
                                                setState(() {
                                                  selectedIndex = index;
                                                  print("selectedIndex is " + "$selectedIndex" );
                                                  saveTheIcon = !saveTheIcon;
                                                  print("saveIcon is " + "$saveTheIcon" );
                                                  print("item saved");
                                                });
                                              },
                                              child: selectedIndex == index ?
                                              Icon(!saveTheIcon ?
                                              Icons.bookmark_border_rounded : Icons.bookmark
                                              ) : const Icon(Icons.bookmark_border_outlined)

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
                                          children:   const [
                                            Text("VQ"),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: Image(image: AssetImage("assets/metascore-modified.png"),fit: BoxFit.contain,),

                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text("AB"),
                                            Text("/%",style: TextStyle(color: Colors.grey),),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            SizedBox(
                                              width: 20,
                                              height: 15,
                                              child: Image(image: AssetImage("assets/imdb1.jpg"),fit: BoxFit.contain,),

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
                                     12.0,
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
                              child:
                              Stack(
                                children: [
                                  Container(
                                    height:
                                    MediaQuery.of(context).size.height /
                                        5.1,
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

                                  // Positioned.fill(
                                  //   child: Align(
                                  //     alignment: Alignment.bottomCenter,
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.only(bottom: 10),
                                  //       child: Container(
                                  //         alignment: Alignment.center,
                                  //         decoration: const BoxDecoration(
                                  //           color: Colors.red,
                                  //           borderRadius: BorderRadius.all(Radius.circular(12))
                                  //         ),
                                  //         width: width * 0.22,
                                  //         height: height*0.03,
                                  //       child: const Text(
                                  //         "Dubbed",style: TextStyle(fontWeight: FontWeight.w600),
                                  //       ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // )

                                ],
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
                                    const Text("All the information about the Movie page",style: TextStyle(color: Colors.grey),textAlign: TextAlign.right,),
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



            ],

          ),
        ),
      ),
    );
  }
}
