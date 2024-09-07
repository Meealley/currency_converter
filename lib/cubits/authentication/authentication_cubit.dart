import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_routers/models/auth_model.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState.initial());

  bool _isUsernameValid(String username) {
    return username.length > 4;
  }

  bool _isPasswordValid(String password) {
    final RegExp regExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$',
    );
    return regExp.hasMatch(password);
  }

  void authenticate(String username, String password) {
    if (_isUsernameValid(username) && _isPasswordValid(password)) {
      final authModel = AuthModel(username: username, password: password);
      final newState = state.copyWith(authModel: authModel);
      print({newState.authModel.username, newState.authModel.password});
      emit(newState);

      print("Authentication Successful for $username");
    } else {
      print("Invalid username or password");
    }
  }

  // void usernameChanged(String username) {
  //   final isValidusername = _isUsernameValid(username);
  //   final authModel = state.authModel.copyWith(username: username);
  //   emit(
  //     state.copyWith(
  //       authModel: authModel,
  //       usernameError: isValidusername
  //           ? null
  //           : "Username must be longer that 4 characters",
  //     ),
  //   );
  // }

  // void passwordChanged(String password) {
  //   final isValidPassword = _isPasswordValid(password);
  //   final authModel = state.authModel.copyWith(password: password);
  //   emit(
  //     state.copyWith(
  //         authModel: authModel,
  //         passwordError: isValidPassword
  //             ? null
  //             : "Password must be at least 8 characters long and include a mix of upper and lower case letters, numbers, and symbols"),
  //   );
  // }
}
