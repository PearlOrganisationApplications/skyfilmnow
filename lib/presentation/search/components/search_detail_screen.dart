import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skyfilmnow/searchBloc/search_bloc.dart';
import 'package:skyfilmnow/searchBloc/search_state.dart';

import '../../../searchBloc/search_event.dart';
class SearchDetailScreen extends StatefulWidget {
  const SearchDetailScreen({Key? key}) : super(key: key);

  @override
  State<SearchDetailScreen> createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen>
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.4),
        highlightColor: Colors.grey.withOpacity(0.1),
        // enabled: _enabled,
        child: Container(
          color: Colors.black,
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Center(child: Text('adjagk',style: const TextStyle(color: Colors.black),)),
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      context.read<SearchBloc>().add(Searchh());
      // emit(SearchhState());


    });
  }
}
