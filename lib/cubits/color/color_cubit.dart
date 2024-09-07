import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState.initial());

  void changeColor() {
    if (state.color == Colors.blue) {
      emit(state.copyWith(color: Colors.green));
    } else if (state.color == Colors.green) {
      emit(state.copyWith(color: Colors.orange));
    } else if (state.color == Colors.orange) {
      emit(state.copyWith(color: Colors.red));
    } else if (state.color == Colors.red) {
      emit(state.copyWith(color: Colors.yellow));
    } else if (state.color == Colors.yellow) {
      emit(state.copyWith(color: Colors.blue));
    }
  }
}
