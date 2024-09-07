// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';

// import 'package:equatable/equatable.dart';

part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  final AuthModel authModel;
  final String? usernameError;
  final String? passwordError;

  const AuthenticationState({
    required this.authModel,
    this.usernameError,
    this.passwordError,
  });

  factory AuthenticationState.initial() {
    return AuthenticationState(
      authModel: AuthModel(username: "", password: ""),
      usernameError: null,
      passwordError: null,
    );
  }

  @override
  List<Object?> get props => [authModel, usernameError, passwordError];

  @override
  bool get stringify => true;

  AuthenticationState copyWith({
    AuthModel? authModel,
    String? usernameError,
    String? passwordError,
  }) {
    return AuthenticationState(
      authModel: authModel ?? this.authModel,
      usernameError: usernameError ?? this.usernameError,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}
