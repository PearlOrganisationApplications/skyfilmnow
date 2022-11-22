import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyfilmnow/searchBloc/search_event.dart';
import 'package:skyfilmnow/searchBloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState>
{
  SearchBloc() : super(SearchInitialState()){
    on<SearchInitialEvent>(_onSearchInitialEvent);
    on<SearchDetailScreenEvent>(_onSearchDetailEventScreen);
    on<Searchh>(_onSearchEvent);
  }


  FutureOr<void> _onSearchInitialEvent(SearchInitialEvent event, Emitter<SearchState> emit)
  {
    emit(SearchInitialState());

  }

  FutureOr<void> _onSearchDetailEventScreen(SearchDetailScreenEvent event, Emitter<SearchState> emit)
  {
    emit(SearchDetailScreenState());


  }

  FutureOr<void> _onSearchEvent(Searchh event, Emitter<SearchState> emit)
  {
    emit(SearchhState());
  }
}