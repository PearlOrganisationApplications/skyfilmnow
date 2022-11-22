import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../movie_screens/languagee.dart';
import '../../../movie_screens/movie_play_and_about_section.dart';
import '../../../movie_screens/play_movie.dart';
import '../../../movie_screens/producte.dart';
import '../../../movie_screens/serials_file.dart';
import '../../../theme_dark_light/change_theme.dart';
import '../../../theme_dark_light/themes.dart';
import 'movie_in_category.dart';

int _selectedContainerIndex = 0;
class MoviePlayCategoryScreenTheme extends StatelessWidget {
  const MoviePlayCategoryScreenTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const MoviePlayCategoryScreen(),
        );
      },
    );
  }
}


class MoviePlayCategoryScreen extends StatefulWidget {
  const MoviePlayCategoryScreen({Key? key}) : super(key: key);

  @override
  State<MoviePlayCategoryScreen> createState() => _MoviePlayCategoryScreenState();
}

class _MoviePlayCategoryScreenState extends State<MoviePlayCategoryScreen> {

  ///apply loader in favourites
  applyIncrementLoader()  async{
    setState(() {
      showHideContainer = true;
    });
    await Future.delayed(const Duration(seconds: 1),(){
      print("Increment");
    });
    setState(() {
      myIndexValue++;
      myText  = "abc";
      showHideContainer = false;

    });
  }
  applyDecrementLoader() async {
    setState(() {
      showHideContainer = true;
    });
    await Future.delayed(const Duration(seconds: 1),(){
      print("decrement");
    });
    setState(() {
      myIndexValue--;
      myText  = "xyz";
      showHideContainer = false;
    });


  }

  ///select index of follow and download button
  int _selectedIndex = 0;
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  ///name of the containers in a list
  List<String> containerInput = ["Release date","Language","Time","The product"];

  ///change color of selected container
  List<Widget> _containerList() {
    return List.generate(4,(index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedContainerIndex = index;
            if(_selectedContainerIndex == 1){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguageTheme()),
              );

            }
            if(_selectedContainerIndex == 3){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductsTheme()),
              );

            }
          });
        },
        child:  Provider.of<MyDynamicTheme>(context).isDarkMode ?
        Container(
          decoration: BoxDecoration(
              color: _selectedContainerIndex == index ? Colors.white : Colors.transparent,
              border: Border.all(color:  Colors.white   ),
              borderRadius: const BorderRadius.all(
                  Radius.circular(13))),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 5,
          height: 40,
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text(
                containerInput[index],
                style: TextStyle(color: _selectedContainerIndex == index ? Colors.black : Colors.white,
                    fontSize: 7),
              ),
              const Divider(
                height: 2,color: Colors.transparent,
              ),
              Text(
                "25/12/12",
                style: TextStyle(
                    color: _selectedContainerIndex == index ? Colors.black : Colors.white,
                    fontSize: 7),
              )
            ],
          ),
        )  :
        Container(
          decoration: BoxDecoration(
              color: _selectedContainerIndex == index ? Colors.blue.shade500 : Colors.white,
              border: Border.all(color: _selectedContainerIndex == index ? Colors.blue.shade500 : Colors.grey.shade300, ),
              borderRadius: const BorderRadius.all(
                  Radius.circular(13))),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 5,
          height: 40,
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text(
                containerInput[index],
                style: TextStyle(color: _selectedContainerIndex == index ? Colors.white : Colors.blue.shade800,
                    fontSize: 7),
              ),
              const Divider(
                height: 2,color: Colors.transparent,
              ),
              Text(
                "25/12/12",
                style: TextStyle(
                    color: _selectedContainerIndex == index ? Colors.white : Colors.blue.shade800,
                    fontSize: 7),
              )
            ],
          ),
        ) ,
      );
    }).toList();
  }

  final DraggableScrollableController draggableScrollableController = DraggableScrollableController();
  ScrollController scrollController = ScrollController();
  final double expandedHight = 150.0;

  double get top {
    double res = expandedHight;
    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      if (offset < (res - kToolbarHeight)) {
        res -= offset;
      } else {
        res = kToolbarHeight;
      }
    }
    return res;
  }
  final ScrollController _controller = ScrollController();
  bool bookmark = false;
  bool favourite = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    final width =  MediaQuery.of(context).size.width;
    final height =  MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  child: Stack(
                    children:  [
                      Container(
                        height: height/3,
                        width:  width,
                        child: Stack(
                          children: [
                            Container(
                              width: width,
                              child: const Image(
                                image: AssetImage("assets/rommel.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 35,left: 20,right: 20,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration:   BoxDecoration(
                                          color: bookmark ? Colors.blue.shade800  : Colors.black54,
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          // border: Border.all(width: 1, color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.white )
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              bookmark = !bookmark;
                                            });

                                            print("Add To The Bookmark");
                                          },
                                          icon:  bookmark ?  const Center(child: Icon(Icons.bookmark,color: Colors.white,size: 20,)) :  const Center(child: Icon(Icons.bookmark_border_rounded,color: Colors.white,size: 20,)) ,
                                        ),
                                      ),
                                      Container(
                                        width: 10,
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                          color: favourite ? Colors.red  : Colors.black54,
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          // border: Border.all(width: 1,color:   Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.white )
                                        ),
                                        child: IconButton(

                                          onPressed: () {
                                            setState(() {
                                              favourite = !favourite;
                                            });

                                            print("Adding To The Favourite List");
                                          },
                                          icon: favourite ?   const Icon(Icons.favorite,color: Colors.white,) :   const Icon(Icons.favorite_border_rounded,color: Colors.white,) ,
                                        ),
                                      ),

                                    ],
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.05,
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ///border: Border.all(width: 2,  color: Colors.blueAccent ,)
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        print("Back To Category Page");
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:   EdgeInsets.only(top: height/3.4),
                        child: Container(
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20) ),
                              color: Provider.of<MyDynamicTheme>(context).isDarkMode ? const Color(0xff3c3c3c): Colors.white ,
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ///********************* PlayButton Section **********************///
                                        InkWell(
                                          onTap: () {
                                             Get.to(const MovieInCategoryScreenTheme());
                                          },
                                          child: Icon(
                                            Icons.play_circle_fill_rounded,
                                            color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.blue.shade800 ,
                                            size: 100,
                                          ),

                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                              "sddlsdfdsf",
                                              style: TextStyle(
                                                fontSize: 20,

                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: Text(
                                                "The Anarchists",
                                                style: TextStyle(
                                                  fontSize: 20,

                                                ),
                                              ),
                                            ),

                                            ///Icon on tab increment & decrement

                                            Padding(
                                              padding: const EdgeInsets.only(top: 15),
                                              child: Row(
                                                children: <Widget>[
                                                  InkWell(
                                                    onTap: () {
                                                      onTapFavourite = !onTapFavourite;
                                                   //   log("on tap  " +"$onTapFavourite");
                                                      onTapFavourite ?  applyIncrementLoader() :  applyDecrementLoader();
                                                      setState(() {});
                                                    },
                                                    child:
                                                    onTapFavourite  ?
                                                    Container(
                                                      alignment: Alignment.center,
                                                      width: MediaQuery.of(context).size.width * 0.22,
                                                      decoration: BoxDecoration(
                                                          color:
                                                          showHideContainer == true ?  Colors.yellow : Colors.red,
                                                          borderRadius:
                                                          const BorderRadius.all(
                                                              Radius.circular(12))),
                                                      height: 30,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: <Widget>[
                                                          showHideContainer == true ?
                                                          const SizedBox(
                                                              height: 20,
                                                              width: 20,
                                                              child: CircularProgressIndicator()) : Text(
                                                            myText,
                                                            style: const TextStyle(
                                                                fontSize: 8,
                                                                color: Colors.black),
                                                          ) ,
                                                          Text(
                                                            myIndexValue.toString(),
                                                            style: const TextStyle(
                                                                fontSize: 13,
                                                                color: Colors.black),
                                                          ),
                                                          const Icon(
                                                            Icons.favorite,
                                                            size: 2,
                                                            color: Colors.black,
                                                          )

                                                        ],
                                                      ),
                                                    ):
                                                    Container(
                                                      alignment: Alignment.center,
                                                      width: MediaQuery.of(context).size.width * 0.22,
                                                      decoration: BoxDecoration(
                                                          color:   showHideContainer == true ?  Colors.yellow : Colors.pink.shade200,
                                                          borderRadius:
                                                          const BorderRadius.all(
                                                              Radius.circular(12))),
                                                      height: 30,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          showHideContainer == true ?
                                                          const SizedBox(
                                                              height: 20,
                                                              width: 20,
                                                              child: CircularProgressIndicator()) : Text(
                                                            myText,
                                                            style: const TextStyle(
                                                                fontSize: 8,
                                                                color: Colors.black),
                                                          ),
                                                          Text(
                                                            myIndexValue.toString(),
                                                            style: const TextStyle(
                                                                fontSize: 13,
                                                                color: Colors.black),
                                                          ),
                                                          const Icon(
                                                            Icons.favorite_border,
                                                            size: 2,
                                                            color: Colors.black,
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.22,
                                                    decoration: const BoxDecoration(
                                                        color:   Colors.black26 ,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(12))),
                                                    height: 30,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: const <Widget>[
                                                        Text(
                                                          "xyz",
                                                          style: TextStyle(
                                                            fontSize: 8,
                                                          ),
                                                        ),
                                                        Text(
                                                          "0",
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.mode_comment_outlined,
                                                          size: 2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: <Widget>[
                                                  InkWell(
                                                    onTap:(){
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => const GenreThemeClass()),
                                                      );
                                                    },
                                                    child: Container(
                                                      height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                          0.030,
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.15,
                                                      child:   Center(
                                                        child: Text(
                                                          "Drama",
                                                          style: TextStyle(
                                                              color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.grey ,
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.grey ,
                                                    width: 1,
                                                    height:  height *
                                                        0.025,
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => const GenreThemeClass()),
                                                      );
                                                    },
                                                    child: Container(
                                                      height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                          0.030,
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.15,
                                                      child:   Center(
                                                        child: Text(
                                                          "Action",
                                                          style: TextStyle(
                                                              color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.grey ,
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.grey ,
                                                    width: 1,
                                                    height:  height *
                                                        0.025,
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => const GenreThemeClass()),
                                                      );
                                                    },
                                                    child: SizedBox(
                                                      height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                          0.030,
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.15,
                                                      child:   Center(
                                                        child: Text(
                                                          "Genre",
                                                          style: TextStyle(
                                                              color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.grey ,
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Row(
                                                children: <Widget>[
                                                  const Text("VQ"),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: Image(image: AssetImage("assets/metascore-modified.png")),

                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  const Text("AB"),
                                                  const Text("/%",style: TextStyle(color: Colors.grey),),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  const SizedBox(
                                                    width: 18,
                                                    height: 18,
                                                    child: Image(image: AssetImage("assets/imdb1.jpg"),fit: BoxFit.contain,),

                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Container(
                                                    decoration: const BoxDecoration(
                                                        color:   Colors.black26 ,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(12))),
                                                    alignment: Alignment.centerRight,
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.30,
                                                    height: 28,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: const [
                                                        Text("ID:tt37236"),
                                                        // Text("IMDB")
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 15),
                                              child: Text(
                                                "Story",
                                                style: TextStyle(
                                                    color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.grey , fontSize: 25),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        height:
                                        MediaQuery.of(context).size.height * 0.1,
                                        width:
                                        MediaQuery.of(context).size.width * 0.88,
                                        child: Text(
                                          "Erwin Rommel (1891-1944.gfdfghgfhghjgjhghjgthghgffghf)",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.blue.shade800 ,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Provider.of<MyDynamicTheme>(context).isDarkMode ?
                                  Container(
                                    width: width,
                                    height: height *0.07,

                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            _onSelected(index);},
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5,left: 5),
                                            child: Container(
                                              width:index == 0 ? width /4 : width *0.58,
                                              decoration: BoxDecoration(
                                                  color:  _selectedIndex != null && _selectedIndex == index ? Colors.white : Colors.transparent,
                                                  borderRadius: BorderRadius.circular(10),border: Border.all(  color:  Colors.white   )),
                                              child: index == 0 ?
                                              Center(child: Text( "Follow",
                                                style: TextStyle(color:_selectedIndex != null && _selectedIndex == index ? Colors.black :Colors.white ), ))
                                                  : Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("Download",
                                                    style: TextStyle(color:_selectedIndex != null && _selectedIndex == index ? Colors.black :Colors.white ), ),
                                                  Icon(Icons.download,color:_selectedIndex != null && _selectedIndex == index ? Colors.black :Colors.white,size: 17,)
                                                ],
                                              ),
                                            ),
                                          ),

                                        );
                                      },
                                    ),
                                  ) :
                                  Container(
                                    width: width,
                                    height: height *0.07,

                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            _onSelected(index);},
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5,left: 5),
                                            child: Container(
                                              width:index == 0 ? width /4 : width *0.58,
                                              decoration: BoxDecoration(
                                                  color:  _selectedIndex != null && _selectedIndex == index ? Colors.blue.shade500 : Colors.white,
                                                  borderRadius: BorderRadius.circular(10),border: Border.all(  color:_selectedIndex != null && _selectedIndex == index ? Colors.blue :Colors.grey.shade300 )),
                                              child:index == 0? Center(
                                                  child: Text(
                                                    "Follow",
                                                    style: TextStyle(color:_selectedIndex != null && _selectedIndex == index ? Colors.white :Colors.blue.shade800 ), )) :
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Download",
                                                    style: TextStyle(color:_selectedIndex != null && _selectedIndex == index ? Colors.white :Colors.blue.shade800 ), ),
                                                  Icon(Icons.download,color:_selectedIndex != null && _selectedIndex == index ? Colors.white :Colors.blue.shade800,size: 17,)
                                                ],
                                              ),
                                            ),
                                          ),

                                        );
                                      },
                                    ),
                                  ) ,
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text("ShowingTheData",style: TextStyle(color: Colors.red),)
                                    ],
                                  ),
                                  const SizedBox(height: 15),

                                  Container(

                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        ..._containerList()
                                      ],
                                    ),
                                  ) ,

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:   <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Text(
                                          "Actors",
                                          style: TextStyle(
                                              fontSize: 30,  color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.grey ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      actorList("assets/rommel.jpg", "Ron Paul"),
                                      Container(
                                        width: 10,
                                      ),
                                      actorList("assets/rommelA.jpg", "Juan Galt"),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: InkWell(
                                              onTap: () {},
                                              child: const Icon(
                                                Icons.add,

                                              )),
                                        ),
                                        const Text(
                                          "Comments",
                                          style: TextStyle(
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Column(
                                      children: const <Widget>[
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Not Decided Here",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(top: 35, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const <Widget>[
                                        Text(
                                          "Suggested Movies",
                                          style: TextStyle(
                                              fontSize: 30, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///******************** Suggested Movies Section ****************///
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.30,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      // physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return suggestedMovie(
                                            "assets/harem.png",
                                            const Icon(Icons.ac_unit_rounded,color: Colors.yellow,),
                                            context
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),

                              ///edjeodfjej
                            )),
                      )
                    ],
                  ),
                ),
              ),
              // Positioned(
              //     child: Container(
              //       height: 30,
              //       decoration: BoxDecoration(
              //         color:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Color(0xff3c3c3c): Colors.white ,
              //         borderRadius: const BorderRadius.only(
              //           topLeft: Radius.circular(30),
              //           topRight: Radius.circular(30),
              //         ),
              //       ),
              //     ),
              //     bottom: -1,
              //     left: 0,
              //     right: 0)
            ],
          ),
        ),

        //    backgroundColor: Colors.black,
        // extendBodyBehindAppBar: true,
        //  appBar: AppBar(
        //    systemOverlayStyle: const SystemUiOverlayStyle(
        //      statusBarColor: Colors.transparent,
        //      statusBarIconBrightness: Brightness.dark,
        //      statusBarBrightness: Brightness.light,
        //    ),
        //    elevation: 0,
        //
        //
        //  ),
        ///sliver body
        //   body: CustomScrollView(
        //     slivers: <Widget>[
        //       SliverAppBar(
        //         leadingWidth: 220,
        //         leading: Row(
        //           crossAxisAlignment: CrossAxisAlignment.stretch,
        //           children: <Widget>[
        //             Padding(
        //               padding: const EdgeInsets.fromLTRB(2, 9, 2, 9),
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.all(Radius.circular(18)),
        //                     border: Border.all(width: 2, color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.white )),
        //                 child: IconButton(
        //                   onPressed: () {
        //                     print("Add To The Bookmark");
        //                   },
        //                   icon: const Icon(Icons.bookmark_border_rounded,color: Colors.white,),
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.fromLTRB(4, 9, 2, 9),
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.all(Radius.circular(18)),
        //                     border: Border.all(width: 2,color:   Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.white )),
        //                 child: IconButton(
        //                   // iconSize: 40,
        //                   onPressed: () {
        //                     print("Adding To The Favourite List");
        //                   },
        //                   icon: const Icon(Icons.favorite_border_rounded,color: Colors.white,),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         actions: <Widget>[
        //           Padding(
        //             padding: const EdgeInsets.fromLTRB(4, 9, 4, 9),
        //             child: Container(
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.all(Radius.circular(18)),
        //                   border: Border.all(width: 2,  color: Colors.white ,)),
        //               child: IconButton(
        //                 onPressed: () {
        //                   Navigator.of(context).pop();
        //                   print("Back To Category Page");
        //                 },
        //                 icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
        //               ),
        //             ),
        //           ),
        //         ],
        //         backgroundColor: Colors.transparent,
        //         expandedHeight: 250.0,
        //         pinned: false,
        //         flexibleSpace: Stack(
        //           children: [
        //             Positioned(
        //                 child: Image(
        //                   image: AssetImage("assets/rommel.png"),
        //                   fit: BoxFit.fill,
        //                 ),
        //                 top: 0,
        //                 left: 0,
        //                 right: 0,
        //                 bottom: 0),
        //             Positioned(
        //                 child: Container(
        //                   height: 30,
        //                   decoration: BoxDecoration(
        //                     color:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Color(0xff3c3c3c): Colors.white ,
        //                     borderRadius: const BorderRadius.only(
        //                       topLeft: Radius.circular(30),
        //                       topRight: Radius.circular(30),
        //                     ),
        //                   ),
        //                 ),
        //                 bottom: -1,
        //                 left: 0,
        //                 right: 0)
        //           ],
        //           // background: Image(image:AssetImage("assets/rommel.png"),fit: BoxFit.fill, )
        //         ),
        //       ),
        //       // SliverToBoxAdapter(
        //       //   child: Container(
        //       //     height: 50,
        //       //     decoration: BoxDecoration(
        //       //       color: Colors.blueGrey[800],
        //       //       borderRadius: const BorderRadius.only(
        //       //         topLeft: Radius.circular(30),
        //       //         topRight: Radius.circular(30),
        //       //       ),
        //       //     ),
        //       //   ),
        //       // ),
        //
        //       SliverList(
        //         delegate: SliverChildBuilderDelegate(
        //           (BuildContext context, int index) {
        //             return Container(
        //                 decoration: BoxDecoration(
        //                  color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Color(0xff3c3c3c): Colors.white ,
        //                 ),
        //                 child: Padding(
        //                   padding:
        //                       const EdgeInsets.only(left: 20, right: 20, top: 5),
        //                   child: Column(
        //                     children: <Widget>[
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: <Widget>[
        //                           ///********************* PlayButton Section **********************///
        //                           ElevatedButton(
        //                             onPressed: () {
        //                               Get.to(const PlayMovieTheme());
        //                             },
        //                             child: Icon(
        //                               Icons.play_circle_fill_rounded,
        //                               color: Colors.black,
        //                               size: 100,
        //                             ),
        //                             style: ElevatedButton.styleFrom(
        //
        //                                 elevation: 0,
        //                                 primary: Colors.transparent,
        //                                 shape: RoundedRectangleBorder(
        //                                     borderRadius:
        //                                         BorderRadius.circular(00))),
        //                           ),
        //
        //                           Column(
        //                             crossAxisAlignment: CrossAxisAlignment.end,
        //                             children: [
        //                               Text(
        //                                 "sddlsdfdsf",
        //                                 style: TextStyle(
        //                                   fontSize: 20.sp,
        //
        //                                 ),
        //                               ),
        //                               Padding(
        //                                 padding: EdgeInsets.only(top: 8),
        //                                 child: Text(
        //                                   "The Anarchists",
        //                                   style: TextStyle(
        //                                     fontSize: 20.sp,
        //
        //                                   ),
        //                                 ),
        //                               ),
        //
        //                               ///Icon on tab increment & decrement
        //
        //                               Padding(
        //                                 padding: const EdgeInsets.only(top: 15),
        //                                 child: Row(
        //                                   children: <Widget>[
        //                                     InkWell(
        //                                       onTap: () {
        //                                         onTapFavourite = !onTapFavourite;
        //                                         onTapFavourite ? myIndexValue++ : myIndexValue--;
        //                                         setState(() {});
        //                                         print("set state");
        //                                       },
        //                                       child: Container(
        //                                         alignment: Alignment.center,
        //                                         width: MediaQuery.of(context)
        //                                                 .size
        //                                                 .width *
        //                                             0.22,
        //                                         decoration: BoxDecoration(
        //                                             color: onTapFavourite
        //                                                 ? Colors.red
        //                                                 : Colors.pink.shade200,
        //                                             borderRadius:
        //                                                 BorderRadius.all(
        //                                                     Radius.circular(12))),
        //                                         height: 30,
        //                                         child: Row(
        //                                           mainAxisAlignment:
        //                                               MainAxisAlignment
        //                                                   .spaceEvenly,
        //                                           children: <Widget>[
        //
        //                                             Text(
        //                                               "xyz",
        //                                               style: TextStyle(
        //                                                   fontSize: 8.sp,
        //                                                   color: Colors.black),
        //                                             ),
        //                                             Text(
        //                                               myIndexValue.toString(),
        //                                               style: TextStyle(
        //                                                   fontSize: 13,
        //                                                   color: Colors.black),
        //                                             ),
        //                                             onTapFavourite
        //                                                 ? Icon(
        //                                                     Icons.favorite,
        //                                                     size: 2.h,
        //                                                     color: Colors.black,
        //                                                   )
        //                                                 : Icon(
        //                                                     Icons
        //                                                         .favorite_border_rounded,
        //                                                     size: 2.h,
        //                                                     color: Colors.black),
        //                                           ],
        //                                         ),
        //                                       ),
        //                                     ),
        //                                     const SizedBox(width: 10),
        //                                     Container(
        //                                       alignment: Alignment.center,
        //                                       width: MediaQuery.of(context)
        //                                               .size
        //                                               .width *
        //                                           0.22,
        //                                       decoration: BoxDecoration(
        //                                           color:   Colors.black26 ,
        //                                           borderRadius: BorderRadius.all(
        //                                               Radius.circular(12))),
        //                                       height: 30,
        //                                       child: Row(
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment.spaceEvenly,
        //                                         children: <Widget>[
        //                                           Text(
        //                                             "xyz",
        //                                             style: TextStyle(
        //                                                 fontSize: 8.sp,
        //                                                ),
        //                                           ),
        //                                           Text(
        //                                             "0",
        //                                             style: TextStyle(
        //                                                 fontSize: 13,
        //                                                ),
        //                                           ),
        //                                           Icon(
        //                                               Icons.mode_comment_outlined,
        //                                               size: 2.h,
        //                                               ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                               Padding(
        //                                 padding: const EdgeInsets.only(top: 15),
        //                                 child: Row(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.end,
        //                                   children: <Widget>[
        //                                     Container(
        //                                       height: MediaQuery.of(context)
        //                                               .size
        //                                               .height *
        //                                           0.047,
        //                                       width: MediaQuery.of(context)
        //                                               .size
        //                                               .width *
        //                                           0.18,
        //                                       child:   Center(
        //                                         child: Text(
        //                                           "Genre",
        //                                           style: TextStyle(
        //                                               color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.grey ,
        //                                               fontSize: 18),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                               Padding(
        //                                 padding: const EdgeInsets.only(top: 0),
        //                                 child: Row(
        //                                   children: <Widget>[
        //                                     Text(
        //                                       "FQ %",
        //
        //                                     ),
        //                                     SizedBox(
        //                                       width: 10,
        //                                     ),
        //                                     Icon(
        //                                       Icons.account_tree,
        //                                       color: Colors.yellow,
        //                                     ),
        //                                     SizedBox(
        //                                       width: 10,
        //                                     ),
        //                                     Container(
        //                                       decoration: BoxDecoration(
        //                                           color:   Colors.black26 ,
        //                                           borderRadius: BorderRadius.all(
        //                                               Radius.circular(12))),
        //                                       alignment: Alignment.centerRight,
        //                                       width: MediaQuery.of(context)
        //                                               .size
        //                                               .width *
        //                                           0.30,
        //                                       height: 28,
        //                                       child: Row(
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment.center,
        //                                         children: [
        //                                           Text("tt3723627"),
        //                                           Text("IMBD")
        //                                         ],
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                               Padding(
        //                                 padding: const EdgeInsets.only(top: 15),
        //                                 child: Text(
        //                                   "Story",
        //                                   style: TextStyle(
        //                                       color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.grey , fontSize: 25),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.end,
        //                         children: [
        //                           Container(
        //                             alignment: Alignment.centerRight,
        //                             height:
        //                                 MediaQuery.of(context).size.height * 0.1,
        //                             width:
        //                                 MediaQuery.of(context).size.width * 0.88,
        //                             child: Text(
        //                               "Erwin Rommel (1891-1944.gfdfghgfhghjgjhghjgthghgffghf)",
        //                               maxLines: 2,
        //                               overflow: TextOverflow.ellipsis,
        //                               style: TextStyle(
        //
        //                                 fontSize: 20,
        //                               ),
        //                               textAlign: TextAlign.right,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: <Widget>[
        //                           Padding(
        //                             padding: const EdgeInsets.only(top: 8),
        //                             child: SizedBox(
        //                               height: MediaQuery.of(context).size.height *
        //                                   0.08,
        //                               width:
        //                                   MediaQuery.of(context).size.width / 3.2,
        //                               child: ElevatedButton(
        //                                 style: ElevatedButton.styleFrom(
        //                                   primary: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.black26: Colors.grey,
        //                                   side:   BorderSide(
        //                                       width: .5,  color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.grey: Colors.black),
        //                                 ),
        //                                 onPressed: () {
        //                                   print("Follow");
        //                                 },
        //                                 child:   Text("Follow",style: TextStyle(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.black),),
        //                               ),
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 5,
        //                           ),
        //                           Padding(
        //                             padding: const EdgeInsets.only(top: 8),
        //                             child: SizedBox(
        //                               height: MediaQuery.of(context).size.height *
        //                                   0.08,
        //                               width:
        //                                   MediaQuery.of(context).size.width / 1.8,
        //                               child: ElevatedButton(
        //                                 style: ElevatedButton.styleFrom(
        //                                   primary: Provider.of<MyDynamicTheme>(context).isDarkMode ?Colors.black26: Colors.grey,
        //                                   side:   BorderSide(
        //                                       width: .5,  color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.grey: Colors.black),
        //                                 ),
        //                                 onPressed: () {
        //                                   print("Download");
        //                                 },
        //                                 child: Row(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children:   <Widget>[
        //                                     Text(
        //                                       "Download",
        //                                       style: TextStyle(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.black),
        //                                     ),
        //                                     Icon(
        //                                       Icons.arrow_downward_rounded,
        //                                       color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.black,
        //                                     )
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //
        //                       const SizedBox(height: 30),
        //                       Container(
        //                         // color: Colors.white,
        //                         width: double.infinity,
        //                         child: Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceEvenly,
        //                           children: <Widget>[
        //                             Container(
        //                               decoration: BoxDecoration(
        //                                   color: Colors.black26,
        //                                   borderRadius: BorderRadius.all(
        //                                       Radius.circular(13))),
        //                               alignment: Alignment.center,
        //                               width:
        //                                   MediaQuery.of(context).size.width / 5,
        //                               height: 40,
        //                               child: Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   Text(
        //                                     "xyz",
        //                                     style: TextStyle(
        //
        //                                         fontSize: 7.sp),
        //                                   ),
        //                                   Divider(
        //                                     height: 2,color: Colors.transparent,
        //                                   ),
        //                                   Text(
        //                                     "25/12/12",
        //                                     style: TextStyle(
        //                                         fontSize: 7.sp),
        //                                   )
        //                                 ],
        //                               ),
        //                             ),
        //                             Container(
        //                               decoration: BoxDecoration(
        //                                   color: Colors.black26,
        //                                   borderRadius: BorderRadius.all(
        //                                       Radius.circular(13))),
        //                               alignment: Alignment.center,
        //                               width:
        //                                   MediaQuery.of(context).size.width / 5,
        //                               height: 40,
        //                               child: Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   Text(
        //                                     "Release Date",
        //                                     style: TextStyle(
        //
        //                                         fontSize: 7.sp),
        //                                   ),
        //                                   Divider(
        //                                     height: 2,color: Colors.transparent,
        //                                   ),
        //                                   Text(
        //                                     "25/12/12",
        //                                     style: TextStyle(
        //
        //                                         fontSize: 7.sp),
        //                                   )
        //                                 ],
        //                               ),
        //                             ),
        //                             Container(
        //                               decoration: BoxDecoration(
        //                                   color: Colors.black26,
        //                                   borderRadius: BorderRadius.all(
        //                                       Radius.circular(13))),
        //                               alignment: Alignment.center,
        //                               width:
        //                                   MediaQuery.of(context).size.width / 5,
        //                               height: 40,
        //                               child: Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   Text(
        //                                     "Release Date",
        //                                     style: TextStyle(
        //
        //                                         fontSize: 7.sp),
        //                                   ),
        //                                   Divider(
        //                                     height: 2,color: Colors.transparent,
        //                                   ),
        //                                   Text(
        //                                     "25/12/12",
        //                                     style: TextStyle(
        //
        //                                         fontSize: 7.sp),
        //                                   )
        //                                 ],
        //                               ),
        //                             ),
        //                             Container(
        //                               decoration: BoxDecoration(
        //                                   color: Colors.black26,
        //                                   borderRadius: BorderRadius.all(
        //                                       Radius.circular(13))),
        //                               alignment: Alignment.center,
        //                               width:
        //                                   MediaQuery.of(context).size.width / 5,
        //                               height: 40,
        //                               child: Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   Text(
        //                                     "Release Date",
        //                                     style: TextStyle(
        //
        //                                         fontSize: 7.sp),
        //                                   ),
        //                                   Divider(
        //                                     height: 2,color: Colors.transparent,
        //                                   ),
        //                                   Text(
        //                                     "25/12/12",
        //                                     style: TextStyle(
        //
        //                                         fontSize: 7.sp),
        //                                   )
        //                                 ],
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.end,
        //                         children:   <Widget>[
        //                           Padding(
        //                             padding: EdgeInsets.only(top: 30),
        //                             child: Text(
        //                               "Actors",
        //                               style: TextStyle(
        //                                   fontSize: 30,  color:Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white: Colors.grey ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.end,
        //                         children: <Widget>[
        //                           actorList("assets/rommel.jpg", "Ron Paul"),
        //                           Container(
        //                             width: 10,
        //                           ),
        //                           actorList("assets/rommelA.jpg", "Juan Galt"),
        //                         ],
        //                       ),
        //
        //                       Padding(
        //                         padding: const EdgeInsets.only(top: 15),
        //                         child: Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                           children: <Widget>[
        //                             Container(
        //                               width: 50,
        //                               height: 50,
        //                               decoration: BoxDecoration(
        //                                   color: Colors.black26,
        //                                   borderRadius: BorderRadius.all(
        //                                       Radius.circular(8))),
        //                               child: InkWell(
        //                                   onTap: () {},
        //                                   child: Icon(
        //                                     Icons.add,
        //
        //                                   )),
        //                             ),
        //                             const Text(
        //                               "Comments",
        //                               style: TextStyle(
        //                                     fontSize: 18),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.only(top: 40),
        //                         child: Column(
        //                           children: const <Widget>[
        //                             Icon(
        //                               Icons.info_outline,
        //                               color: Colors.grey,
        //                             ),
        //                             const SizedBox(height: 10),
        //                             Text(
        //                               "Not Decided Here",
        //                               style: TextStyle(
        //                                 color: Colors.grey,
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       const SizedBox(height: 10),
        //                       Padding(
        //                         padding:
        //                             const EdgeInsets.only(top: 35, bottom: 10),
        //                         child: Row(
        //                           mainAxisAlignment: MainAxisAlignment.end,
        //                           children: const <Widget>[
        //                             Text(
        //                               "Suggested Movies",
        //                               style: TextStyle(
        //                                   fontSize: 30, color: Colors.white),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //
        //                       ///******************** Suggested Movies Section ****************///
        //                       Container(
        //                         width: MediaQuery.of(context).size.width,
        //                         height: MediaQuery.of(context).size.height * 0.25,
        //                         child: ListView.builder(
        //                           scrollDirection: Axis.horizontal,
        //                           // physics: const NeverScrollableScrollPhysics(),
        //                           shrinkWrap: true,
        //                           itemCount: 5,
        //                           itemBuilder: (context, index) {
        //                             return suggestedMovie(
        //                               "assets/harem.png",
        //                               const Icon(Icons.ac_unit_rounded),
        //                             );
        //                           },
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //
        //                   ///edjeodfjej
        //                 ));
        //           },
        //           childCount: 1,
        //         ),
        //       ),
        //     ],
        //   )
      ),
    );
  }
}
