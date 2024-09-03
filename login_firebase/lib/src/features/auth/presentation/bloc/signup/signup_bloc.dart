import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constant.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignUpInitialState()) {
    on<SignupRequestedEvent>(
      _onSignUpRequested,
    );
  }

  void _onSignUpRequested(SignupRequestedEvent event, emit) async {
    emit(SignUpLoadingState());
    try {
      final userName = event.userName;
      final email = event.emailId;
      final mobileNum = event.mobileNumber;
      final password = event.password;
      final rePassword = event.rePassword;

      if (userName.isEmpty ||
          email.isEmpty ||
          mobileNum.isEmpty ||
          password.isEmpty ||
          rePassword.isEmpty) {
        emit(SignUpFailureState(errorMessage: "All the fields are mandatory!"));
        return;
      }

      final bool emailValid = Constant.emailRegExp.hasMatch(email);
      if (!emailValid) {
        emit(SignUpFailureState(
            errorMessage: "Entered email address is Invalid!"));
        return;
      }
      final bool mobileNumValid = Constant.mobileNumRegExp.hasMatch(mobileNum);
      if (!mobileNumValid) {
        emit(SignUpFailureState(
            errorMessage: "Entered mobile number is Invalid!"));
        return;
      }
      if (password.length < 8) {
        emit(SignUpFailureState(
            errorMessage: "Password cannot be less than 8 characters"));
        return;
      }
      if (rePassword.length < 8) {
        emit(SignUpFailureState(
            errorMessage: "Re-Enter Password cannot be less than 8 characters"));
        return;
      }
      if (password != rePassword) {
        emit(SignUpFailureState(
            errorMessage: "Password and Re-Enter password both doesn't match"));
        return;
      }

      //Post data into Firebase Authentication Module
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //Post data into Firebase CLoud Storage as a collection.
      await createUserDocument(userCredential, userName, email, mobileNum, password);
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> createUserDocument(
    UserCredential? userCredential,
    String userName,
    String email,
    String mobileNum,
    String password,
  ) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection(Constant.userTBL)
          .doc(Constant.documentNumber)
          .set({
        "UserName": userName,
        "Email": email,
        "MobileNum": mobileNum,
        "Password": password,
      });
    }
  }
}
