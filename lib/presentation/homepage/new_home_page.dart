import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme_dark_light/change_theme.dart';
import '../category/component/category_initial_screen.dart';
import '../home/homee.dart';
import '../more/profile.dart';
import '../search/search_page.dart';
final List<SalomonBottomBarItem> bottomNavBarIcons = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.more_horiz_outlined,
        color: Colors.grey),
    title: const Text("More"),
    selectedColor: Colors.blue,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.home,color: Colors.grey),
    title: const Text("Home"),
    selectedColor: Colors.blue,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.category_outlined, color: Colors.grey),
    title: const Text("Category"),
    selectedColor: Colors.blue,
  ),
  /// Search
  SalomonBottomBarItem(
    icon: const Icon(Icons.search),
    title: const Text("Gener"),
    selectedColor: Colors.blue,
  ),

];

final screens = [
  const ProfileTheme(),
  const HomeTheme(),
  const CategoryTheme(),
  const SearchTheme(),
];
class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {

  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    //ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      backgroundColor: Provider.of<MyDynamicTheme>(context).isDarkMode?Colors.black:Colors.white,
      body: screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(

        selectedItemColor:
        Provider.of<MyDynamicTheme>(context).isDarkMode?Colors.white:Colors.grey,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: bottomNavBarIcons,
      ),
    );
  }
}

