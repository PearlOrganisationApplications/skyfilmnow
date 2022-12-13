import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:skyfilmnow/resources/color_manager.dart';
import 'package:skyfilmnow/searchBloc/search_bloc.dart';
import 'package:skyfilmnow/searchBloc/search_event.dart';

import '../../../theme_dark_light/change_theme.dart';

class SearchInitialPage extends StatefulWidget {
  const SearchInitialPage({Key? key}) : super(key: key);

  @override
  State<SearchInitialPage> createState() => _SearchInitialPageState();
}

class _SearchInitialPageState extends State<SearchInitialPage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsets.only(
                  left: constraints.maxWidth * 0.02,
                  top: constraints.maxHeight * 0.02),
              child: Text(
                'Genre',
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                    color: Provider.of<MyDynamicTheme>(context).isDarkMode
                        ? Colors.white
                        : Color(0xff3c3c3c)),
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Provider.of<MyDynamicTheme>(context).isDarkMode
                  ? Colors.black26
                  : Colors.grey.shade500,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
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
            //backgroundColor: Color(ColorManager.bgColor),

            body: Container(
              margin: EdgeInsets.only(
                  left: constraints.maxWidth * 0.02,
                  right: constraints.maxWidth * 0.02),
              child: Column(
                children: [
                  Container(
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: constraints.maxHeight * 0.05,
                          left: constraints.maxWidth * 0.02,
                          right: constraints.maxWidth * 0.02),
                      child: TextFormField(
                        controller: _searchController,
                        //  style: TextStyle(color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white.withOpacity(0.6) : Colors.red,),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                              },
                            ),
                            hintText: "Search",
                            // hintStyle: TextStyle( ),
                            // fillColor: Colors.white,

                            // prefixIcon: const Icon(Icons.email, color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color(ColorManager.outlineBorder),
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Color(ColorManager.outlineBorder),
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Container(
                  //   width: constraints.maxHeight,
                  //   height: constraints.maxHeight*0.35,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     // physics: const NeverScrollableScrollPhysics(),
                  //     shrinkWrap: true,
                  //
                  //
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: (){
                  //         },
                  //         child: Container(
                  //             width: constraints.maxWidth*0.50,
                  //             margin: EdgeInsets.only(left: constraints.maxWidth*0.05,right: constraints.maxWidth*0.05),
                  //
                  //             decoration: BoxDecoration(
                  //                 color: Colors.blue,
                  //
                  //                 borderRadius: BorderRadius.circular(10)
                  //             ),
                  //             child: ClipRRect(
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 child: Image.asset("assets/anime.png",fit: BoxFit.cover,))
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 8,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 286,
                      ),
                      itemBuilder: (_, index) => Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<SearchBloc>()
                                  .add(SearchDetailScreenEvent());
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.02,
                                  bottom: constraints.maxHeight * 0.01),
                              height: 300,
                              width: constraints.maxWidth * 0.50,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/dummy_pic.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10.0,
                            left: 12.0,
                            child: Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 80,
                              color: Colors.transparent,
                              child: const Text(
                                "Movie Name",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // child: GridView.builder(
                    //   // physics: const NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    //       maxCrossAxisExtent: 258,
                    //       mainAxisSpacing: 5.0,
                    //       crossAxisSpacing: 5.0),
                    //
                    //   itemCount: 10,
                    //   itemBuilder: (context, index) {
                    //     return GestureDetector(
                    //       onTap: (){
                    //         context.read<SearchBloc>().add(SearchDetailScreenEvent());
                    //       },
                    //       child: Container(
                    //         height: 200,
                    //           width: constraints.maxWidth*0.50,
                    //         decoration: BoxDecoration(
                    //             color: Colors.green,
                    //
                    //             borderRadius: BorderRadius.circular(10)
                    //         ),
                    //         // child: ClipRRect(
                    //         //     borderRadius: BorderRadius.circular(10),
                    //         //     child: Image.asset("assets/dummy_pic.png",fit: BoxFit.cover,))
                    //       ),
                    //     );
                    //   },
                    // ),
                  ),
                  // SizedBox(
                  //   height: constraints.maxHeight * 0.02,
                  // )
                ],
              ),
            ),
          )),
    );
  }
}
