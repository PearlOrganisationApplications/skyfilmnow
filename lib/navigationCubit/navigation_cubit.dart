import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/navbarItem/navbar_item.dart';
import '../theme_dark_light/change_theme.dart';
import 'navigation_state.dart';

// class NavigationTheme extends StatelessWidget {
//   const NavigationTheme({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<SharedPreferences>(
//       future: SharedPreferences.getInstance(),
//       builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
//         return ChangeNotifierProvider<MyDynamicTheme>.value(
//           value: MyDynamicTheme(snapshot.data),
//           child: NavigationCubit(context),
//         );
//       },
//     );
//   }
// }

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationState(
            isloginUser == false ? NavbarItem.more : NavbarItem.home,
            isloginUser == false ? 0 : 1));

  void getNavbarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.more:
        emit(const NavigationState(NavbarItem.more, 0));

        break;
      case NavbarItem.home:
        emit(const NavigationState(
          NavbarItem.home,
          1,
        ),
        );

        break;
      case NavbarItem.category:
        emit(const NavigationState(
          NavbarItem.category,
          2,
        ),
        );

        break;
      case NavbarItem.genre:
        emit(const NavigationState(
          NavbarItem.genre,
          3,
        ),
        );

        break;
    }
  }
}
