import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme_dark_light/change_theme.dart';
import '../home/component/myProfile.dart';
import '../home/component/profile_settings.dart';


class ProfileInfoTheme extends StatelessWidget {
  const ProfileInfoTheme({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: ProfileInfo(),
        );
      },
    );
  }
}


class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo>  {
  @override
  Widget build(BuildContext context) {
    double borderRadius  = 10;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Decoration decoratedContainer = BoxDecoration(
        color: Colors.orangeAccent.shade100,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius))
    );
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin:EdgeInsets.only(top: height/3.4,left: 20,right: 20 ),
                  height: MediaQuery.of(context).size.height*0.22,
                  width: width/1,
                  decoration: BoxDecoration(
                      color:  Provider.of<MyDynamicTheme>(context).isDarkMode ? Color(0xff3c3c3c) : Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50,),
                        child: Text("Homayun Andiwal",style: TextStyle(color: Provider.of<MyDynamicTheme>(context).isDarkMode ?Colors.white : Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                      ),
                      Container(
                        decoration: decoratedContainer,
                        margin: EdgeInsets.only(top: 10),
                        height: height/14,
                        width: width/1.5,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: width/3,
                                child: Text("Package",style: TextStyle(fontWeight: FontWeight.bold,color: Provider.of<MyDynamicTheme>(context).isDarkMode ?Colors.white : Colors.black ),textAlign: TextAlign.right,)),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(13)),
                                  border: Border.all(color: Colors.orange,width: 2)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("ediufhie",style: TextStyle(color:  Colors.orange,fontSize: 15),),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.account_tree,color: Colors.orange ,)
                                ],

                              ),
                            )
                          ],
                        ),

                      )

                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: width,
                    height: height/2,
                    child: ListView.builder(
                      primary:true,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:  4  ,
                      itemBuilder: (BuildContext context,int index){
                        return GestureDetector(
                          onTap: (){
                            if (index == 1){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ProfileSettingTheme()),
                              );
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            height: height/11,
                            width: width,
                            decoration:index ==3 ? BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(0)),

                            ) : BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                border: Border.all(width: 1,color: Colors.grey)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  index == 3 ? Container() : Icon(Icons.arrow_back_ios_new),
                                  Row(
                                    children: [
                                      Text(ProfileIcons.IconTexts[index],style: index == 3 ?TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.red):TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
                                      SizedBox(
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
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                      child: Image(image: AssetImage("assets/sea_icon.jpg"),fit: BoxFit.fill,width: width,)),
                  height: height/4,
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color:  Colors.black54,
                          borderRadius: BorderRadius.all(Radius.circular(11))
                      ),
                      width: 35,
                      height: 35,
                      child: Icon(Icons.arrow_forward_ios_rounded,size: 18,color:   Colors.white,),
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
                height: height/1.8,
                width: width/3.5,
                decoration: BoxDecoration(
                  ///  color: Colors.transparent,
                    shape: BoxShape.circle
                ),
                child: CircleAvatar(
                    child: Image(image:AssetImage("assets/profile.png"),)

                ),
              )

            ],
          ),


        ],
      ),
    );
  }
}
