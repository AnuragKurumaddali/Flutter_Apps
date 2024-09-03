part of 'login_bloc.dart';

@immutable
sealed class LoginState{}

class LoginInitialState extends LoginState{}

class LoginSuccessState extends LoginState{
  final String uid;

  LoginSuccessState(this.uid);//or any DataModel object

}
class LoginFailureState extends LoginState{
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}

class LoginLoadingState extends LoginState{

}