import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:skyfilmnow/searchBloc/search_bloc.dart';
import 'package:skyfilmnow/searchBloc/search_event.dart';
import 'package:skyfilmnow/theme_dark_light/change_theme.dart';

import '../../../movie_screens/movie_play_and_about_section.dart';
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context,constraints)=>WillPopScope(
        onWillPop: _onWillPopCallback,
        child: Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Column(children: [
            const Padding(padding: EdgeInsets.only(left: 10,right: 10,),),
            Expanded(child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
                return Padding(padding: EdgeInsets.only(left: 10,right: 10,),
                child: Column(children: [
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/3.1,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      Padding(padding: EdgeInsets.only(left: 10,),
                      child: Container(
                        //color: Colors.yellow,
                        height: MediaQuery.of(context).size.width / 1.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10,left: 20.0),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap:(){},
                                  child:const Icon(
                                    Icons.bookmark_border_outlined,
                                  )
                                ),
                                const SizedBox(width: 38,),
                                Text('Movie Name',style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ],
                            ),
                            ),
                             Padding(
                              padding:const EdgeInsets.only(top: 5,left: 80.0),
                             child: Text('Imdb',style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                  fontWeight: FontWeight.bold,color: Colors.grey),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 7,left: 80.0),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                              padding: EdgeInsets.only(top: 7,left: 80.0,),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const MoviePlayTheme()));
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
                                          "assets/dummy_pic.png",
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
                  )
                ],),
                );
              },
            ),
            ),
          ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPopCallback() async
  {
    context.read<SearchBloc>().add(SearchInitialEvent());
    return false;
  }
}
