import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  bool visibleForm1 = false;
  bool visibleForm2 = false;
  AppCubit() : super(AppInitial());
  void changeVisible1() {
    visibleForm1 = !visibleForm1;
    emit(ChangeVisibleState());
  }
  void changeVisible2() {
    visibleForm2 = !visibleForm2;
    emit(ChangeVisibleState());
  }
}
