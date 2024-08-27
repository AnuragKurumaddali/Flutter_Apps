import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/constants/constant.dart';

part 'auth_login_event.dart';
part 'auth_login_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  void _onAuthLoginRequested(event, emit) async {
    emit(AuthLoadingState());
    try {
      final email = event.email;
      final password = event.password;

      //For Email also similar validation is necessary
      final bool emailValid = Constant.emailRegExp.hasMatch(email);
      if (!emailValid) {
        emit(AuthFailureState(
            errorMessage: "Password cannot be less than 8 characters"));
        return;
      }
      if (password.length < 8) {
        emit(AuthFailureState(
            errorMessage: "Password cannot be less than 8 characters"));
        return;
      }

      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccessState("Login successful - $email:$password"));
      }); //This is for performing network operations or Database operations
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  void _onAuthLogoutRequested(event, emit) {
    return;
  }
}
