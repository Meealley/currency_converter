// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';

part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;

  const ThemeState({required this.appTheme});

  factory ThemeState.initial() {
    return const ThemeState(appTheme: AppTheme.light);
  }

  @override
  List<Object> get props => [appTheme];

  @override
  bool get stringify => true;

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
