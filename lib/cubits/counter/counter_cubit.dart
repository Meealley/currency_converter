import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_routers/cubits/color/color_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  int incremntSize = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription colorSubscription;

  CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
    colorSubscription = colorCubit.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.blue) {
        incremntSize = 1;
      } else if (colorState.color == Colors.green) {
        incremntSize = 3;
      } else if (colorState.color == Colors.orange) {
        incremntSize = 7;
      } else if (colorState.color == Colors.red) {
        incremntSize = -15;
      } else if (colorState.color == Colors.yellow) {
        incremntSize = 30;
        // emit(state.copyWith(counter: state.counter + incremntSize));
      }
    });
  }
  void changeCounter() {
    emit(
      state.copyWith(counter: state.counter + incremntSize),
    );
  }

  @override
  Future<void> close() {
    // TODO: implement close
    colorSubscription.cancel();
    return super.close();
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    print("Counter from Storage : $json");
    final counterState = CounterState.fromJson(json);
    print("Counter state : $counterState");
    return counterState;
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    print("CounterState to storage : $state");
    final counterJson = state.toJson();
    print("Counter state : $counterJson");
    return counterJson;
  }
}
