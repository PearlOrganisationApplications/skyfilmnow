import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfilmnow/presentation/home/component/homepage_inital.dart';

import '../../homePageBloc/homepage_bloc.dart';
import '../../homePageBloc/homepage_state.dart';
import '../../theme_dark_light/change_theme.dart';
import '../../theme_dark_light/themes.dart';
import '../more/profile.dart';
import 'component/myProfile.dart';

class HomeTheme extends StatelessWidget {
  const HomeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: Home(),
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: Scaffold(

        resizeToAvoidBottomInset: false,
        body: BlocBuilder<HomePageBloc ,HomePageState>(
            builder: (context,state)
            {

              if(state is HomePageInitialState  )
              {
                return const HomePageInitial();
              }
              return Container();

            }),
      ),
    );
  }
}













// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context,constraints)=>Scaffold(
//           appBar: AppBar(
//             actions: [
//               Padding(
//                 padding:  EdgeInsets.only(left: constraints.maxWidth*0.01,right: constraints.maxWidth*0.02,top: constraints.maxHeight*0.01,bottom: constraints.maxHeight*0.01),
//                 child: Image.asset("assets/profile.png"),
//               )
//               // Icon()
//
//             ],
//
//             title: Text('Home',style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.8),color: Colors.white.withOpacity(0.8)),),
//             systemOverlayStyle:   const SystemUiOverlayStyle(
//               statusBarColor: Colors.black,
//               statusBarIconBrightness: Brightness.dark,
//               statusBarBrightness: Brightness.light,
//             ),
//             elevation: 0,
//             flexibleSpace: Container(
//               decoration: const BoxDecoration(
//                   color: Colors.black,
//               ),
//             ),
//           ),
//           body: Scaffold(
//             backgroundColor: Color(ColorManager.bgColor),
//
//             body: SingleChildScrollView(
//               child: Container(
//                 margin: EdgeInsets.only(left: constraints.maxWidth*0.02,right: constraints.maxWidth*0.02),
//                 child: Column(
//                   children: [
//                     Container(
//                         width: constraints.maxWidth,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Container(
//                           margin: EdgeInsets.only(top: constraints.maxHeight*0.05,left: constraints.maxWidth*0.02,right: constraints.maxWidth*0.02),
//                           child: TextFormField(
//                             style: TextStyle(color: Colors.white.withOpacity(0.6)),
//                             cursorColor: Colors.white,
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: InputDecoration(
//                                 suffixIcon: IconButton(icon:const Icon(Icons.clear),color: Colors.white.withOpacity(0.6),onPressed: (){
//                                 },),
//                                 hintText: "Search",
//                                 hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
//                                 // fillColor: Colors.white,
//                                 filled: true,
//                                 // prefixIcon: const Icon(Icons.email, color: Colors.black),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide:  BorderSide(
//                                       color: Color(ColorManager.outlineBorder),
//                                       style: BorderStyle.solid,
//                                       width: 1),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide:  BorderSide(
//                                       color: Color(ColorManager.outlineBorder),
//                                       style: BorderStyle.solid,
//                                       width: 1),
//                                 ),
//                                 labelStyle: const TextStyle(color: Colors.white)),
//                           ),
//                         )
//                     ),
//                     const SizedBox(height: 30,),
//                     Container(
//                       width: constraints.maxHeight,
//                       height: constraints.maxHeight*0.25,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//
//
//                         itemCount: 5,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: (){
//                             },
//                             child: Container(
//                               width: constraints.maxWidth*0.82,
//                                 margin: EdgeInsets.only(left: constraints.maxWidth*0.02,right: constraints.maxWidth*0.02),
//
//                                 decoration: BoxDecoration(
//                                     color: Colors.blue,
//
//                                     borderRadius: BorderRadius.circular(10)
//                                 ),
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.asset("assets/dummy_pic.png",fit: BoxFit.cover,))
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(height: constraints.maxHeight*0.03,),
//
//                     Container(
//                       width: constraints.maxWidth,
//                       margin: EdgeInsets.only(left: constraints.maxWidth*0.07,right: constraints.maxWidth*0.02),
//
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               width: constraints.maxWidth,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('The Latest Serials',style: TextStyle(color: Colors.white,fontSize: ResponsiveFlutter.of(context).fontSize(1.8),fontWeight: FontWeight.bold,letterSpacing: 0.6),),
//
//                                   Text('All',style: TextStyle(color: Colors.white,fontSize: ResponsiveFlutter.of(context).fontSize(1.8),fontWeight: FontWeight.bold,letterSpacing: 0.6),),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 19,),
//
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: constraints.maxHeight*0.03,),
//
//                     Container(
//                       width: constraints.maxHeight/0.05,
//                       height: constraints.maxHeight*0.05,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//
//
//                         itemCount: data.length,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: (){
//                             },
//                             child: Container(
//                                 width: constraints.maxWidth*0.18,
//                                 margin: EdgeInsets.only(left: constraints.maxWidth*0.05,right: constraints.maxWidth*0.05),
//
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//
//                                     borderRadius: BorderRadius.circular(10)
//                                 ),
//                               child: Center(child: Text(data[index]['name'])),
//
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(height: constraints.maxHeight*0.05,),
//
//                     Container(
//                       width: constraints.maxHeight,
//                       height: constraints.maxHeight*0.35,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//
//
//                         itemCount: 5,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: (){
//                             },
//                             child: Container(
//                                 width: constraints.maxWidth*0.50,
//                                 margin: EdgeInsets.only(left: constraints.maxWidth*0.05,right: constraints.maxWidth*0.05),
//
//                                 decoration: BoxDecoration(
//                                     color: Colors.blue,
//
//                                     borderRadius: BorderRadius.circular(10)
//                                 ),
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.asset("assets/anime.png",fit: BoxFit.cover,))
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(height: constraints.maxHeight*0.03,),
//
//                     Container(
//                       width: constraints.maxWidth,
//                       margin: EdgeInsets.only(left: constraints.maxWidth*0.07,right: constraints.maxWidth*0.02),
//
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               width: constraints.maxWidth,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Last Updated Movies',style: TextStyle(color: Colors.white,fontSize: ResponsiveFlutter.of(context).fontSize(1.8),fontWeight: FontWeight.bold,letterSpacing: 0.6),),
//
//                                   Text('All',style: TextStyle(color: Colors.white,fontSize: ResponsiveFlutter.of(context).fontSize(1.8),fontWeight: FontWeight.bold,letterSpacing: 0.6),),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 19,),
//
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: constraints.maxHeight*0.05,),
//
//                     Container(
//                       width: constraints.maxHeight,
//                       height: constraints.maxHeight*0.35,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//
//
//                         itemCount: 5,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: (){
//                             },
//                             child: Container(
//                                 width: constraints.maxWidth*0.50,
//                                 margin: EdgeInsets.only(left: constraints.maxWidth*0.05,right: constraints.maxWidth*0.05),
//
//                                 decoration: BoxDecoration(
//                                     color: Colors.blue,
//
//                                     borderRadius: BorderRadius.circular(10)
//                                 ),
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.asset("assets/grown_up.png",fit: BoxFit.cover,))
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//
//                     SizedBox(height: constraints.maxHeight*0.03,),
//
//                     Container(
//                       width: constraints.maxWidth,
//                       margin: EdgeInsets.only(left: constraints.maxWidth*0.07,right: constraints.maxWidth*0.02),
//
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               width: constraints.maxWidth,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Dubbed',style: TextStyle(color: Colors.white,fontSize: ResponsiveFlutter.of(context).fontSize(1.8),fontWeight: FontWeight.bold,letterSpacing: 0.6),),
//
//                                   Text('All',style: TextStyle(color: Colors.white,fontSize: ResponsiveFlutter.of(context).fontSize(1.8),fontWeight: FontWeight.bold,letterSpacing: 0.6),),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10,),
//                           const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 19,),
//
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: constraints.maxHeight*0.03,),
//                     Container(
//                       width: constraints.maxHeight/0.05,
//                       height: constraints.maxHeight*0.05,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//
//
//                         itemCount: serials.length,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: (){
//                             },
//                             child: Container(
//                               width: constraints.maxWidth*0.18,
//                               margin: EdgeInsets.only(left: constraints.maxWidth*0.05,right: constraints.maxWidth*0.05),
//
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//
//                                   borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: Center(child: Text(serials[index]['name'])),
//
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//
//                     SizedBox(height: constraints.maxHeight*0.03,),
//
//                     Container(
//                       width: constraints.maxHeight,
//                       height: constraints.maxHeight*0.35,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//
//
//                         itemCount: 5,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: (){
//                             },
//                             child: Container(
//                                 width: constraints.maxWidth*0.50,
//                                 margin: EdgeInsets.only(left: constraints.maxWidth*0.05,right: constraints.maxWidth*0.05),
//
//                                 decoration: BoxDecoration(
//                                     color: Colors.blue,
//
//                                     borderRadius: BorderRadius.circular(10)
//                                 ),
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.asset("assets/dummy_pic.png",fit: BoxFit.cover,))
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           )
//       ),
//     );
//   }
// }
