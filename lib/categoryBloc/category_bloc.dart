import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skyfilmnow/categoryBloc/category_event.dart';
import 'package:skyfilmnow/categoryBloc/category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>
{
  CategoryBloc():super(CategoryInitialState()){
    on<CategoryInitialScreenEvent>(_onCategoryInitialEvent);

  }

  FutureOr<void> _onCategoryInitialEvent(CategoryInitialScreenEvent event, Emitter<CategoryState> emit)
  {
    emit(CategoryInitialState());
  }
}