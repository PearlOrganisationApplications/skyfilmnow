import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyfilmnow/categoryBloc/category_bloc.dart';
import 'package:skyfilmnow/categoryBloc/category_state.dart';

import 'component/category_initial_screen.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
        if (state is CategoryInitialState) {
          return CategoryInitialScreen();
        }

        return Container();
      }),
    );
  }
}
