import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_routers/utils/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void changeTheme(int rnadInt) {
    if (rnadInt % 2 == 0) {
      final newState = state.copyWith(appTheme: AppTheme.light);
      emit(newState);
    } else {
      final newState = state.copyWith(appTheme: AppTheme.dark);
      emit(newState);
    }
  }
}
