import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:skyfilmnow/presentation/home/component/profile_settings.dart';

import '../../../theme_dark_light/change_theme.dart';

class MyProfileScreenTheme extends StatelessWidget {
  const MyProfileScreenTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: const MyProfileScreen(),
        );
      },
    );
  }
}

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double borderRadius = 10;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Decoration decoratedContainer = BoxDecoration(
        color: Colors.orangeAccent.shade100,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)));
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: height / 3.4, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: width / 1,
                  decoration: BoxDecoration(
                      color: Provider.of<MyDynamicTheme>(context).isDarkMode
                          ? const Color(0xff3c3c3c)
                          : Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                        ),
                        child: Text(
                          "SkyfileNow",
                          style: TextStyle(
                              color: Provider.of<MyDynamicTheme>(context)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        decoration: decoratedContainer,
                        margin: const EdgeInsets.only(top: 10),
                        height: height / 14,
                        width: width / 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: width / 3,
                                child: Text(
                                  "Package",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Provider.of<MyDynamicTheme>(context)
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.black),
                                  textAlign: TextAlign.right,
                                )),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(13)),
                                  border: Border.all(
                                      color: Colors.orange, width: 2)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    "ediufhie",
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.account_tree,
                                    color: Colors.orange,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          print("Favourite");
                        },
                        child: Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * .40,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/crown.png"))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 80.0, right: 15),
                                  child: Text(
                                    "Hello Skyfilm",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: (){print("Watch History");},
                        child: Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * .40,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/crown.png"))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 80.0, right: 15),
                                  child: Text(
                                    "Hello Skyfilm",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: width,
                    height: height / 2,
                    child: ListView.builder(
                      primary: true,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileSettingTheme()),
                              );
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            height: height / 11,
                            width: width,
                            decoration: index == 3
                                ? const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)),
                                  )
                                : BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  index == 3
                                      ? Container()
                                      : const Icon(Icons.arrow_back_ios_new),
                                  Row(
                                    children: [
                                      Text(ProfileIcons.IconTexts[index],
                                          style: index == 3
                                              ? const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.red)
                                              : const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ProfileIcons.myIcons[index]
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  height: height / 4,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      child: Image(
                        image: const AssetImage("assets/sea_icon.jpg"),
                        fit: BoxFit.fill,
                        width: width,
                      )),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.all(Radius.circular(11))),
                      width: 35,
                      height: 35,
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height / 1.8,
                width: width / 3.5,
                decoration: const BoxDecoration(

                    ///  color: Colors.transparent,
                    shape: BoxShape.circle),
                child: const CircleAvatar(
                    child: Image(
                  image: AssetImage("assets/profile.png"),
                )),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget suggestedMovie(String sugImg, Icon icon, BuildContext? context) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8),
    child: Stack(
      children: [
        Container(
          width: MediaQuery.of(context!).size.width / 2.6,
          height: MediaQuery.of(context).size.width / 2.8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/sun_set.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(width: 40, height: 40, child: icon),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                const Text(
                  //textAlign: TextAlign.right,
                  "wdfwdfikdjfidffdfdf",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              ],
            )),
      ],
    ),
  );
}

///list of icons
class ProfileIcons {
  static List<Icon> myIcons = [
    const Icon(Icons.archive_outlined),
    const Icon(Icons.settings),
    const Icon(Icons.message),
    const Icon(
      Icons.arrow_forward_rounded,
      color: Colors.red,
    ),
  ];
  static List<String> IconTexts = [
    "Likes",
    "Profile Settings",
    "Sign out",
    "Log out",
  ];
}
