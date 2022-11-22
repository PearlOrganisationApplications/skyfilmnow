import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfilmnow/Serial%20Screen/serial_about_play_screen.dart';
import 'package:skyfilmnow/theme_dark_light/themes.dart';

import '../theme_dark_light/change_theme.dart';

class WesternSerialsTheme extends StatefulWidget {
  const WesternSerialsTheme({Key? key}) : super(key: key);

  @override
  State<WesternSerialsTheme> createState() => _WesternSerialsThemeState();
}

class _WesternSerialsThemeState extends State<WesternSerialsTheme> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context,
          AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const WesternSerialsPage(),
        );
      },
    );
  }
}

class WesternSerialsPage extends StatefulWidget {
  const WesternSerialsPage({Key? key}) : super(key: key);

  @override
  State<WesternSerialsPage> createState() => _WesternSerialsPageState();
}

class _WesternSerialsPageState extends State<WesternSerialsPage> {
  bool saveIcon = false;
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    var height  = MediaQuery.of(context).size.height;
    bool showDarkMode = Provider.of<MyDynamicTheme>(context).isDarkMode;
    var width =  MediaQuery.of(context).size.width;
    return    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize:  const Size.fromHeight(90.0),
          child: AppBar(

            backgroundColor:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.grey.shade900 : Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Western Serials",
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
        body: LayoutBuilder(

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
                Expanded(child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return Padding(padding: const EdgeInsets.only(left: 10,
                      right: 10,
                    ),
                      child: Column(children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3.1,
                          width: MediaQuery.of(context).size.width,

                          child: Stack(children: [
                            Padding(
                              padding:const EdgeInsets.only(left: 10,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.9,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: [
                                    Padding(padding: EdgeInsets.only(top: 10,
                                    ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
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
                                              ) : const Icon(Icons.bookmark_border_outlined)

                                          ),
                                          const SizedBox(width: 10,),
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
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children:  const [
                                            Text("VQ"),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            SizedBox(
                                              width: 15,
                                              height:15,
                                              child: Image(image: AssetImage("assets/metascore-modified.png"),fit: BoxFit.contain,),

                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text("AB"),
                                            Text("/%",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,),),
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
                                      ),
                                    ),
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
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SerialPlayAndAboutSection()));
                                    },
                                    child: Container(
                                      height:
                                      MediaQuery.of(context).size.height /
                                          5.2,
                                      width:
                                      MediaQuery.of(context).size.width /
                                          2.8,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                "assets/harem.png",
                                              ),
                                              fit: BoxFit.fill),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
    );
  }
}
