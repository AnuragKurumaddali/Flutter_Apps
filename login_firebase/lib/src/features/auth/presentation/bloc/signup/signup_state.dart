part of 'signup_bloc.dart';

@immutable
sealed class SignupState{}

class SignUpInitialState extends SignupState{}

class SignUpSuccessState extends SignupState{
}

class SignUpFailureState extends SignupState{
  final String errorMessage;

  SignUpFailureState({required this.errorMessage});
}

class SignUpLoadingState extends SignupState{}

