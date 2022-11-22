import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../homePageBloc/homepage_bloc.dart';
import '../../../theme_dark_light/change_theme.dart';
import '../../../theme_dark_light/themes.dart';
bool instantChange = false;
class ProfileSettingTheme extends StatelessWidget {
  const ProfileSettingTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: ProfileSettings(),
        );
      },
    );
  }
}

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Color(0xFF303031) : Colors.white,
            actions: [
              Row(

                children: [
                    Text("Profile Settings",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.w600,color: Provider.of<MyDynamicTheme>(context).isDarkMode ? Colors.white : Colors.black,)),
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
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  height: MediaQuery.of(context).size.height / 6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.green),
                              borderRadius:
                              const    BorderRadius.all(Radius.circular(10))),
                          child: const Icon(
                            Icons.verified_user,
                            size: 16,
                            color: Colors.green,
                          ),
                        ),
                        const  Flexible(
                          child: Padding(
                            padding:   EdgeInsets.only(left: 10, right: 10),
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  hintText: "Homauon Andiwal",
                                  hintStyle: TextStyle(
                                      fontSize: 17.0,),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.grey))),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration:const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle),
                          child:const CircleAvatar(
                              child: Image(
                            image: AssetImage("assets/profile.png"),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    width: width,
                    height: height / 2,
                    child: ListView.builder(
                      primary: true,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: index == 2 ?Alignment.center:Alignment.centerRight,
                          margin:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          height: height / 11,
                          width: width,
                           decoration : BoxDecoration(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(width: 1, color:   Colors.grey  )),
                          child:  Padding(
                            padding:  const EdgeInsets.only(right: 10),
                            child:index == 2 ? GestureDetector(
                              onTap: (){
                                print("working");
                              },
                              child: Text("Change save",style: TextStyle(
                                  fontSize: 17.0,  ),),
                            ):
                            TextField(
                              textAlign:  TextAlign.right,
                              decoration: InputDecoration(
                                hintText: textValues[index]["name"],
                                  hintStyle: const TextStyle(
                                      fontSize: 17.0,),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,),
                            )
                          )

                        );
                      },
                    ),
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
List<Map> textValues = [
  {"name" : "New Password",},
  {"name" : "Type again new password",},
];
