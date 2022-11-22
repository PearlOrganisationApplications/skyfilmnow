import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfilmnow/Serial%20Screen/serial_about_play_screen.dart';
import 'package:skyfilmnow/movie_screens/movie_play_and_about_section.dart';
import 'package:skyfilmnow/presentation/category/component/serials_in_category.dart';
import 'package:skyfilmnow/presentation/category/component/series_play_category.dart';
import 'package:skyfilmnow/presentation/category/component/top_250_imbd.dart';
import 'package:skyfilmnow/Serial%20Screen/serial_page.dart';

import '../../../Serial Screen/Country.dart';
import '../../../Serial Screen/gener.dart';
import '../../../Serial Screen/serials_top_250_imbd.dart';
import '../../../data/utils.dart';
import '../../../movie_screens/country.dart';
import '../../../movie_screens/gener.dart';
import '../../../movie_screens/languagee.dart';
import '../../../movie_screens/serials_file.dart';
import '../../../resources/color_manager.dart';
import '../../../theme_dark_light/change_theme.dart';
import '../../../theme_dark_light/themes.dart';
import '../../more/profile.dart';
import 'Movie_series_.dart';
import 'movie_in_category.dart';
import 'movie_play_category.dart';
import 'movie_series_bottom.dart';



class CategoryTheme extends StatelessWidget {
  const CategoryTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const CategoryInitialScreen(),
        );
      },
    );
  }
}

class CategoryInitialScreen extends StatefulWidget {
  const CategoryInitialScreen({Key? key}) : super(key: key);

  @override
  State<CategoryInitialScreen> createState() => _CategoryInitialScreenState();
}

class _CategoryInitialScreenState extends State<CategoryInitialScreen> {
  List<Map<String, String>> MovieName = [
    {"name": "Rommel","country": "content","genre": "area"},
    {"name": "Squad","country": "dataSource","genre": "rectangle"},
    {"name": "Dhamal","country": "models","genre": "square"},
    {"name": "Avangers","country": "overview","genre": "circle"},
    {"name": "Endgame","country": "loadings","genre": "octagon"},
    {"name": "Karan Arjun","country": "nested","genre": "pentagon"},
    {"name": "Weathering with you","country": "courage","genre": "hexagon"},
    {"name": "I Want to Eat Your Pencrease","country": "honesty","genre": "triangle"},
    {"name": "Your Name","country": "astonished","genre": "sphere"},
    {"name": "SPIRITED AWAY","country": "gather","genre": "rhombus"}
  ];

  bool serial = false;
  bool movies = false;
bool country = false;
bool genre = false;
bool country1 = false;
bool genre1 = false;
  int _selectedIndex = 0;
  int _selectedIndex1 = 0;
  int _selectedIndex2 = 0;
  _onSelected(
    int index,
  ) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _onSelected1(
    int index,
  ) {
    setState(() {
      _selectedIndex1 = index;
    });
  }

  _onSelected2(
    int index,
  ) {
    setState(() {
      _selectedIndex2 = index;
    });
  }

  @override
  Widget build(BuildContext context) {
//SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: SafeArea(
        child: Scaffold(
          backgroundColor:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.red : Colors.blue,
          body: LayoutBuilder(
            builder: (context, constraints) => Scaffold(
                appBar: AppBar (
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:
                        Provider.of<MyDynamicTheme>(context).isDarkMode
                            ? Colors.black54
                            : Colors.grey.shade500,
                    statusBarIconBrightness: Brightness.light,
                    // systemNavigationBarColor:    Provider.of<MyDynamicTheme>(context).isDarkMode ?Colors.black : Colors.white,
                    // systemNavigationBarDividerColor:  Provider.of<MyDynamicTheme>(context).isDarkMode ?Colors.black : Colors.white,
                    statusBarBrightness: Brightness.light,
                  ),

                  actions: const [],
                  title: Text(
                    'Movies and serials category',
                    style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                    ),
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
                body: Scaffold(
                  // backgroundColor: Color(ColorManager.bgColor),
                  body: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: constraints.maxWidth * 0.02,
                          right: constraints.maxWidth * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: constraints.maxHeight * 0.03,
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.07,
                                  right: constraints.maxWidth * 0.02),
                              child: Text(
                                'Movie',
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.8),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.6),
                              )),

                          ///******** Movie Language And Country And Genre Section. ********///
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
                                    itemCount: language.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          _onSelected(index);
                                          if(_selectedIndex == 0){
                                            country = false;
                                            genre = false;
                                          }
                                          if(_selectedIndex == 1){
                                            setState((){
                                              country = true;
                                              genre = false;
                                            });
                                          }
                                          if (_selectedIndex == 2){
                                            setState((){
                                              genre = true;
                                              country = false;
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
                                                color:
                                                    Provider.of<MyDynamicTheme>(
                                                                context)
                                                            .isDarkMode
                                                        ? Colors.white
                                                        : Colors.grey.shade300,
                                              )),
                                          child: Center(
                                              child: Text(
                                            language[index]['name'],
                                            style: TextStyle(
                                                color: _selectedIndex != null &&
                                                        _selectedIndex == index
                                                    ? Colors.black
                                                    : Colors.white),
                                          ),
                                          ),
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
                                    itemCount: language.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          _onSelected(index);
                                          if(_selectedIndex == 0){
                                            country = false;
                                            genre = false;
                                          }
                                          if(_selectedIndex == 1){
                                            setState((){
                                              country = true;
                                              genre = false;
                                            });
                                          }
                                          if (_selectedIndex == 2){
                                            setState((){
                                              genre = true;
                                              country = false;
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
                                            language[index]['name'],
                                            style: TextStyle(
                                                color: _selectedIndex != null &&
                                                        _selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                          ///************* Movie Card Section **********///
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          country == true ?
                          Container(
                            width: constraints.maxHeight,
                            height: constraints.maxHeight * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      const MovieCountryTheme(),
                                    );
                                    print("Rommel");
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: constraints.maxWidth * 0.50,
                                        margin: EdgeInsets.only(
                                            left: constraints.maxWidth * 0.01,
                                            right: constraints.maxWidth * 0.02),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            "assets/shawshank.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                        Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          MovieName[index]["country"].toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ) : genre  ?
                          Container(
                            width: constraints.maxHeight,
                            height: constraints.maxHeight * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      const MovieGenerTheme(),
                                    );
                                    print("Rommel");
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: constraints.maxWidth * 0.50,
                                        margin: EdgeInsets.only(
                                            left: constraints.maxWidth * 0.01,
                                            right: constraints.maxWidth * 0.02),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            "assets/harem.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          MovieName[index]["genre"].toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ) : Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {


                                    Navigator.push(context,MaterialPageRoute(builder: (context)=> const LanguageTheme()));
                                    print("Rommel");
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: constraints.maxWidth * 0.50,
                                        margin: EdgeInsets.only(
                                            left: constraints.maxWidth * 0.01,
                                            right: constraints.maxWidth * 0.02),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            "assets/rommel.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,

                                        child: Padding(
                                          padding: const EdgeInsets.only(right:20,bottom: 10.0),
                                          child: Text(
                                            MovieName[index]["name"].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          ///****************************** Series Section From Here *********************************///
                          SizedBox(
                            height: constraints.maxHeight * 0.03,
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.07,
                                  right: constraints.maxWidth * 0.02),
                              child: Text(
                                'Serials',
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.8),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.6),
                              )),
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
                                    itemCount: language.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          _onSelected1(index);
                                          if(_selectedIndex1 == 0){
                                            country1 = false;
                                            genre1 = false;
                                          }
                                          if(_selectedIndex1 == 1){
                                            setState((){
                                              country1 = true;
                                              genre1 = false;
                                            });
                                          }
                                          if (_selectedIndex1 == 2){
                                            setState((){
                                              genre1 = true;
                                              country1 = false;
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
                                            language[index]['name'],
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
                                    itemCount: language.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          _onSelected1(index);
                                          if(_selectedIndex1 == 0){
                                            country1 = false;
                                            genre1 = false;
                                          }
                                          if(_selectedIndex1 == 1){
                                            setState((){
                                              country1 = true;
                                              genre1 = false;
                                            });
                                          }
                                          if (_selectedIndex1 == 2){
                                            setState((){
                                              genre1 = true;
                                              country1 = false;
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
                                            language[index]['name'],
                                            style: TextStyle(
                                                color: _selectedIndex1 != null &&
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

                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                         country1 ?
                         Container(
                            width: constraints.maxHeight,
                            height: constraints.maxHeight * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,

                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => const SerialsCountryTheme());
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                          width: constraints.maxWidth * 0.50,
                                          margin: EdgeInsets.only(
                                              left: constraints.maxWidth * 0.01,
                                              right: constraints.maxWidth * 0.02),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(
                                                "assets/rommel.jpg",
                                                fit: BoxFit.cover,
                                              ))),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          MovieName[index]["country"].toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ) : genre1 ?  Container(
                           width: constraints.maxHeight,
                           height: constraints.maxHeight * 0.35,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             // physics: const NeverScrollableScrollPhysics(),
                             shrinkWrap: true,

                             itemCount: 5,
                             itemBuilder: (context, index) {
                               return GestureDetector(
                                 onTap: () {
                                   Get.to(() => const SerialsGenerTheme());
                                 },
                                 child: Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     Container(
                                         width: constraints.maxWidth * 0.50,
                                         margin: EdgeInsets.only(
                                             left: constraints.maxWidth * 0.01,
                                             right: constraints.maxWidth * 0.02),
                                         decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(10)),
                                         child: ClipRRect(
                                             borderRadius: BorderRadius.circular(10),
                                             child: Image.asset(
                                               "assets/rommelA.jpg",
                                               fit: BoxFit.cover,
                                             ))),
                                     Align(
                                       alignment: Alignment.center,
                                       child: Text(
                                         MovieName[index]["genre"].toString(),
                                         style: const TextStyle(
                                             fontWeight: FontWeight.w500,
                                             color: Colors.white,
                                             fontSize: 15),
                                       ),
                                     ),
                                   ],
                                 ),
                               );
                             },
                           ),
                         ) :  Container(
                           width: constraints.maxHeight,
                           height: constraints.maxHeight * 0.35,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             // physics: const NeverScrollableScrollPhysics(),
                             shrinkWrap: true,

                             itemCount: 5,
                             itemBuilder: (context, index) {
                               return GestureDetector(
                                 onTap: () {

                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomMovieSeriesTheme()));
                                   // Get.to(() => BottomMovieSeriesTheme());
                                 },
                                 child: Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     Container(
                                         width: constraints.maxWidth * 0.50,
                                         margin: EdgeInsets.only(
                                             left: constraints.maxWidth * 0.01,
                                             right: constraints.maxWidth * 0.02),
                                         decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(10)),
                                         child: ClipRRect(
                                             borderRadius: BorderRadius.circular(10),
                                             child: Image.asset(
                                               "assets/shawshank.png",
                                               fit: BoxFit.cover,
                                             ))),
                                     Align(
                                       alignment: Alignment.center,
                                       child: Text(
                                         MovieName[index]["name"].toString(),
                                         style: const TextStyle(
                                             fontWeight: FontWeight.w500,
                                             color: Colors.white,
                                             fontSize: 15),
                                       ),
                                     ),
                                   ],
                                 ),
                               );
                             },
                           ),
                         ),

                          ///********************************* TOP 250 All Section ********************************///
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
                                          'Top 250 IMDB',
                                          style: TextStyle(
                                              fontSize:
                                                  ResponsiveFlutter.of(context)
                                                      .fontSize(1.8),
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.6),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _selectedIndex2==1?
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => const TopIMBDTheme()),
                                            ): Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                builder: (context) => const SerialsTopIMBDTheme()));
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  'All',
                                                  style: TextStyle(
                                                      color: Provider.of<MyDynamicTheme>(
                                                                  context)
                                                              .isDarkMode
                                                          ? Colors.white
                                                          : Colors.blue,
                                                      fontSize:
                                                          ResponsiveFlutter.of(context)
                                                              .fontSize(1.8),
                                                      fontWeight: FontWeight.bold,
                                                      letterSpacing: 0.6),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Provider.of<MyDynamicTheme>(context)
                                                      .isDarkMode
                                                      ? Colors.white
                                                      : Colors.blue,
                                                  size: 19,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                                    itemCount: serials.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          _onSelected2(index);
                                          if(_selectedIndex2 == 0){
                                            movies = false;

                                          }
                                          if(_selectedIndex2 == 1){
                                            setState((){
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
                                              color: _selectedIndex2 != null &&
                                                      _selectedIndex2 == index
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
                                                color: _selectedIndex2 != null &&
                                                        _selectedIndex2 == index
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
                                          _onSelected2(index);
                                          if(_selectedIndex2 == 0){
                                            movies = false;

                                          }
                                          if(_selectedIndex2 == 1){
                                            setState((){
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
                                              color: _selectedIndex2 != null &&
                                                      _selectedIndex2 == index
                                                  ? Colors.blue.shade500
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: _selectedIndex2 !=
                                                              null &&
                                                          _selectedIndex2 == index
                                                      ? Colors.blue
                                                      : Colors.grey.shade300)),
                                          child: Center(
                                              child: Text(
                                            serials[index]['name'],
                                            style: TextStyle(
                                                color: _selectedIndex2 != null &&
                                                        _selectedIndex2 == index
                                                    ? Colors.white
                                                    : Colors.black),
                                          )),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                          SizedBox(
                            height: constraints.maxHeight * 0.03,
                          ),
                          Stack(
                             alignment: Alignment.center,
                            children: [
                             movies == true ?
                             Container(
                                width: constraints.maxHeight,
                                height: constraints.maxHeight * 0.35,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                          Get.to(const MoviePlayCategoryScreenTheme());
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Container(
                                              width: constraints.maxWidth * 0.50,
                                              margin: EdgeInsets.only(
                                                  left: constraints.maxWidth * 0.01,
                                                  right: constraints.maxWidth * 0.02),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(10)),
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    "assets/anime.png",
                                                    fit: BoxFit.cover,
                                                  ))),
                                          Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                MovieName[index]["country"].toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ) :
                             Container(
                               width: constraints.maxHeight,
                               height: constraints.maxHeight * 0.35,
                               child: ListView.builder(
                                 scrollDirection: Axis.horizontal,
                                 // physics: const NeverScrollableScrollPhysics(),
                                 shrinkWrap: true,
                                 itemCount: 5,
                                 itemBuilder: (context, index) {
                                   return GestureDetector(
                                     onTap: () {
                                       Get.to(const SeriesPlayCategoryScreenTheme());
                                     },
                                     child: Stack(
                                       alignment: Alignment.bottomRight,
                                       children: [
                                         Container(
                                             width: constraints.maxWidth * 0.50,
                                             margin: EdgeInsets.only(
                                                 left: constraints.maxWidth * 0.01,
                                                 right: constraints.maxWidth * 0.02),
                                             decoration: BoxDecoration(
                                                 color: Colors.blue,
                                                 borderRadius:
                                                 BorderRadius.circular(10)),
                                             child: ClipRRect(
                                                 borderRadius: BorderRadius.circular(10),
                                                 child: Image.asset(
                                                   "assets/harem.png",
                                                   fit: BoxFit.cover,
                                                 ))),
                                         Padding(
                                           padding: const EdgeInsets.all(18.0),
                                           child: Align(
                                             alignment: Alignment.bottomRight,
                                             child: Text(
                                               MovieName[index]["name"].toString(),
                                               style: const TextStyle(
                                                   fontWeight: FontWeight.w500,
                                                   color: Colors.white,
                                                   fontSize: 15),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   );
                                 },
                               ),
                             ),

                            ],
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
        ),
      ),
    );
  }
}
