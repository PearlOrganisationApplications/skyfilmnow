import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyfilmnow/presentation/search/components/search.dart';
import 'package:skyfilmnow/presentation/search/components/search_detail_screen.dart';
import 'package:skyfilmnow/searchBloc/search_bloc.dart';
import 'package:skyfilmnow/searchBloc/search_state.dart';

import '../../theme_dark_light/change_theme.dart';
import '../../theme_dark_light/themes.dart';
import 'components/search_initial_page.dart';
class SearchTheme extends StatelessWidget {
  const SearchTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<MyDynamicTheme>.value(
          value: MyDynamicTheme(snapshot.data),
          child: SearchPage(),
        );
      },
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyDynamicTheme>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<SearchBloc,SearchState>(
            builder: (context,state)
            {
              print('state is '+state.toString());
              if(state is SearchInitialState)
              {
                return const SearchInitialPage();
              }
              else if(state is SearchDetailScreenState)
              {
                return const SearchDetailScreen();
              }
              else if(state is SearchhState)
                {
                  return Search();
                }
              return Container();

            }),
      ),
    );
  }
}
