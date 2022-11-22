import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:skyfilmnow/categoryBloc/category_bloc.dart';
import 'package:skyfilmnow/homePageBloc/homepage_bloc.dart';
import 'package:skyfilmnow/presentation/homepage/components/bottom_screen_page.dart';
import 'package:skyfilmnow/presentation/homepage/home_page.dart';
import 'package:skyfilmnow/presentation/homepage/new_home_page.dart';
import 'package:skyfilmnow/presentation/splash/splash_screen.dart';
import 'package:skyfilmnow/searchBloc/search_bloc.dart';
import 'package:skyfilmnow/theme_dark_light/change_theme.dart';
import 'package:skyfilmnow/theme_dark_light/theme_color.dart';
import 'blocs/authentication_bloc.dart';
import 'blocs/authentication_state.dart';
import 'data/repository/authentication_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key, required this.authenticationRepository})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        key: key,
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => SearchBloc(),
          ),
          BlocProvider(
            create: (_) => CategoryBloc(),
          ),
          BlocProvider(
            create: (_) => HomePageBloc(),
          ),

          // BlocProvider(
          //   create: (_) => SignUpBloc(authenticationRepository: authenticationRepository),
          // )
        ],
        child: const MyApp(),
        // BlocProvider(
        //   create: (_) => AuthenticationBloc(
        //     authenticationRepository: authenticationRepository,
        //   ),
        //   child: MyApp(),
        // ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext, DarkThemeProvider, Widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),

            home: const MyAppView(),
          );
        },
      ),

      // child: const MaterialApp(
      //
      //       //theme: ThemeData.light(),
      //      // darkTheme: ThemeData.dark(),
      //       //themeMode: ThemeMode.light,
      //       debugShowCheckedModeBanner: false,
      //       home: MyAppView(),
      //     ),
    );
  }
}

class MyAppView extends StatefulWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    SharedPrefsLogin.getUser();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
//  SharedPrefsLogin.getUser();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, DarkThemeProvider, Widget) {
          return GetMaterialApp(
            // darkTheme: ThemeData.dark(),
            // themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKey,
            builder: (context, child) {
              return BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  print('status is${state.status}');

                  switch (state.status) {
                    case AuthenticationStatus.unknown:
                      _navigator.pushAndRemoveUntil<void>(
                        HomePage.route(),
                        (route) => false,
                      );
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const NewHomePage()));
                      break;
                    case AuthenticationStatus.authenticated:
                      print('Hello authenticated');
                      break;
                    case AuthenticationStatus.unauthenticated:
                      print('Hello unauthenticated');
                      break;
                    default:
                      break;
                  }
                },
                child: child,
              );
            },
            onGenerateRoute: (_) => SplashScreen.route(),
          );
        },
      ),
    );
  }
}
