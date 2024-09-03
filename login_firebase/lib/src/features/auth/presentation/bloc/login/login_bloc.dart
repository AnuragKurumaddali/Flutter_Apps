import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/constants/constant.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginRequestedEvent>(_onLoginRequested);
    on<LogoutRequestedEvent>(_onLogoutRequested);
  }

  void _onLoginRequested(event, emit) async {
    emit(LoginLoadingState());
    try {
      final String email = event.email;
      final String password = event.password;

      if (email.isEmpty || password.isEmpty) {
        emit(LoginFailureState(errorMessage: "All the fields are mandatory!"));
        return;
      }

      //For Email also similar validation is necessary
      final bool emailValid = Constant.emailRegExp.hasMatch(email);
      if (!emailValid) {
        emit(LoginFailureState(
            errorMessage: "Password cannot be less than 8 characters"));
        return;
      }
      if (password.length < 8) {
        emit(LoginFailureState(
            errorMessage: "Password cannot be less than 8 characters"));
        return;
      }

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState("Login successful - $email:$password"));
    } catch (e) {
      emit(LoginFailureState(errorMessage: e.toString()));
    }
  }

  void _onLogoutRequested(event, emit) {
    return;
  }
}
