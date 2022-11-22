import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyfilmnow/homePageBloc/homepage_event.dart';
import 'package:skyfilmnow/homePageBloc/homepage_state.dart';

class HomePageBloc extends Bloc<HomePageEvent,HomePageState>
{
  HomePageBloc():super(HomePageInitialState()){
    on<HomePageInitialScreen>(_onHomePageInitialScreen);
  }


  FutureOr<void> _onHomePageInitialScreen(HomePageInitialScreen event, Emitter<HomePageState> emit)
  {
    emit(HomePageInitialState());
  }


}