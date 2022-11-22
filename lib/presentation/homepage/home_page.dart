import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../navigationCubit/navigation_cubit.dart';
import '../../theme_dark_light/change_theme.dart';
import 'components/bottom_screen_page.dart';

//
// class HomePageTheme extends StatelessWidget {
//   const HomePageTheme({Key? key}) : super(key: key);
//   static Route route() {
//     return MaterialPageRoute<void>(
//         builder: (_) => const HomePageTheme());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<SharedPreferences>(
//       future: SharedPreferences.getInstance(),
//       builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
//         return ChangeNotifierProvider<MyDynamicTheme>.value(
//           value: MyDynamicTheme(snapshot.data),
//           child: HomePage(),
//         );
//       },
//     );
//   }
// }
class HomePageTheme extends StatefulWidget {

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const HomePageTheme());
  }
  const HomePageTheme({Key? key}) : super(key: key);
  @override
  State<HomePageTheme> createState() => _HomePageThemeState();
}

class _HomePageThemeState extends State<HomePageTheme> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),

          child: const HomePage(),
        );
      },
    );
  }
}
class HomePage extends StatefulWidget
{
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const HomePage());
  }
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
            body:
            BlocProvider(create: (context)=>NavigationCubit(),
                child:   const Scaffold(
                  body: BottomScreenPageeTheme(
                  ) ,
                ),
            ),
    );
  }
}
