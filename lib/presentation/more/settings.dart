 import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfilmnow/presentation/more/profile.dart';

import '../../theme_dark_light/change_theme.dart';
import '../../theme_dark_light/themes.dart';

class SettingsTheme extends StatelessWidget {
  const SettingsTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const SettingsPage(),
        );
      },
    );
  }
}


class SettingsPage extends StatefulWidget {
   const SettingsPage({Key? key}) : super(key: key);


   @override
   State<SettingsPage> createState() => _SettingsPageState();
 }

 class _SettingsPageState extends State<SettingsPage> {

  bool cupertinoValueAll = false;
  bool cupertinoValueMovies = false;
  bool cupertinoValueSerials = false;
  bool checkBoxValueAskedEveryTime = false;
  bool checkBoxValueWithAppPlayer = false;
  bool checkBoxValueWithMXPlayer = false;

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) directory = await getExternalStorageDirectory();
      }
    } catch (err, stack) {
      print("Cannot get download folder path");
    }
    return directory?.path;
  }

   @override
   Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
     return   MaterialApp(
       theme: Provider.of<MyDynamicTheme>(context).isDarkMode
           ? setDarkTheme
           : setLightTheme,
       debugShowCheckedModeBanner: false,
       home: Scaffold(
         appBar: PreferredSize(
           preferredSize: const Size.fromHeight(80.0),
           child: AppBar(

             backgroundColor:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.grey.shade900 : Colors.white,
             actions: [
               Padding(
                 padding: const EdgeInsets.only(top: 15),
                 child: Row(

                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text("Settings",
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
         body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(10),
             child: Column(
               children: [
                 Container(
                   alignment: Alignment.centerRight,
                    height: height*0.08,
                   width: width,
                   decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(width: 2.0, color: Colors.grey.shade400),)
                   ),
                   child: const Text("Notifications",style: MyTextStyle.style,),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: Container(
                       alignment: Alignment.centerRight,
                     height: height*0.21,
                     width: width,

                     child: Column(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height*0.07,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               CupertinoSwitch(
                                   activeColor: Colors.green,
                                   trackColor: Colors.grey,
                                   value: cupertinoValueAll, onChanged: (value)=>setState(() {

                                    cupertinoValueAll = value;
                                    cupertinoValueSerials = cupertinoValueAll;
                                    cupertinoValueMovies = cupertinoValueAll;
                               }) ),
                               Container(
                                 width: width *0.5,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: const [
                                     Padding(
                                       padding: EdgeInsets.only(right: 10),
                                       child: Text("All",style: MyTextStyle.style,),
                                     ),
                                     Padding(
                                       padding: EdgeInsets.only(right: 10),
                                       child: Text("Show all notifications about movies and serials",textAlign: TextAlign.right,style: SmallTextStyle.style,),
                                     ),

                                   ],
                                 ),
                               )
                             ],
                           ),
                         ),
                         Container(
                           height: MediaQuery.of(context).size.height*0.06,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               CupertinoSwitch(
                                   activeColor: Colors.green,
                                   trackColor: Colors.grey,
                                   value: cupertinoValueMovies,
                                   onChanged: (value)=>setState(() {
                                 cupertinoValueMovies = value;
                                 if(cupertinoValueMovies == false && cupertinoValueSerials == false ){
                                   cupertinoValueAll = false;
                                 }
                               }) ),
                               Container(
                                 alignment: Alignment.centerRight,
                                 width: width *0.5,
                                 child: const Padding(
                                    padding: EdgeInsets.only(right: 10),
                                   child: Text("Movies only",style: MyTextStyle.style,),
                                 )
                               )
                             ],
                           ),
                         ),
                         Container(
                           height: MediaQuery.of(context).size.height*0.07,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               CupertinoSwitch(

                                   activeColor: Colors.green,
                                   trackColor: Colors.grey,
                                   value: cupertinoValueSerials, onChanged: (value)=>setState(() {
                                 cupertinoValueSerials = value;
                                 if(cupertinoValueMovies == false && cupertinoValueSerials == false ){
                                   cupertinoValueAll = false;
                                 }

                               }) ),
                               Container(
                                 width: width *0.5,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: const [
                                     Padding(
                                       padding: EdgeInsets.only(right: 10),
                                       child: Text("Serials only",style: MyTextStyle.style,),
                                     ),
                                     Padding(
                                       padding: EdgeInsets.only(right: 10),
                                       child: Text("Show all notifications about serials",textAlign: TextAlign.right,style: SmallTextStyle.style,),
                                     ),

                                   ],
                                 ),
                               )
                             ],
                           ),
                         )
                       ],
                     )
                   ),
                 ),
                 Container(
                   alignment: Alignment.centerRight,
                   height: height*0.08,
                   width: width,
                   decoration: BoxDecoration(
                       border: Border(bottom: BorderSide(width: 2.0, color: Colors.grey.shade400),)
                   ),
                   child: const Text("Default player option",style: MyTextStyle.style,),
                 ),
                 Container(
                     alignment: Alignment.centerRight,
                     height: height*0.18,
                     width: width,
                     child: Column(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height*0.06,
                           child:  Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children:   [
                               Text("Asked every time"),
                               const SizedBox(
                                 width: 25,
                               ),
                               Checkbox(value: checkBoxValueAskedEveryTime, onChanged: (value)=>
                               setState(() {
                                 checkBoxValueAskedEveryTime = value!;
                                 checkBoxValueWithAppPlayer = checkBoxValueAskedEveryTime;
                                 checkBoxValueWithMXPlayer = checkBoxValueWithAppPlayer;
                               })

                               ),
                               const SizedBox(
                                 width: 8,
                               ),
                             ],
                           )
                         ),
                         Container(
                             height: MediaQuery.of(context).size.height*0.06,
                             child:  Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children:   [
                                 Text("Play with App player"),
                                 const SizedBox(
                                   width: 25,
                                 ),
                                 Checkbox(value: checkBoxValueWithAppPlayer, onChanged: (value)=>
                                     setState(() {
                                       checkBoxValueWithAppPlayer = value!;
                                       if (checkBoxValueWithAppPlayer == false && checkBoxValueWithMXPlayer == false){
                                         checkBoxValueAskedEveryTime = false;
                                       }
                                     })

                                 ),
                                 const SizedBox(
                                   width: 8,
                                 ),
                               ],
                             )
                         ),
                         Container(
                             height: MediaQuery.of(context).size.height*0.06,
                             child:  Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children:   [
                                 Text("Play with MX player"),
                                 const SizedBox(
                                   width: 25,
                                 ),
                                 Checkbox(value: checkBoxValueWithMXPlayer, onChanged: (value)=>
                                     setState(() {
                                       checkBoxValueWithMXPlayer = value!;
                                       if (checkBoxValueWithAppPlayer == false && checkBoxValueWithMXPlayer == false){
                                         checkBoxValueAskedEveryTime = false;
                                       }
                                     })
                                 ),
                                 const SizedBox(
                                   width: 8,
                                 ),
                               ],
                             )
                         ),
                       ],
                     )
                 ),
                 InkWell(
                   onTap: (){
                     getDownloadPath();
                   },
                   child: Container(
                     alignment: Alignment.centerRight,
                     height: height*0.08,
                     width: width,
                     decoration: BoxDecoration(
                         border: Border(bottom: BorderSide(width: 2.0, color: Colors.grey.shade400),)
                     ),
                     child: const Text("Download",style: MyTextStyle.style,),
                   ),
                 ),
                 Container(
                   height: height*0.08,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         alignment: Alignment.centerLeft,
                         child:  Text(getDownloadPath().toString()),

                         width: width* 0.60,

                       ),
                       const Text("Path directory")
                     ],
                   ),
                 )
               ],

             ),
           ),
         ),
       ),
     );
   }
 }
class MyTextStyle{
  static const  TextStyle style = TextStyle(fontSize: 14,);
}
class SmallTextStyle {
  static const TextStyle style = TextStyle(fontSize: 12 ,color: Colors.grey,);
}
