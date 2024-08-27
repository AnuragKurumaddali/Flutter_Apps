part of 'login/auth_login_bloc.dart';

sealed class AuthState{}

class AuthInitialState extends AuthState{}

class AuthSuccessState extends AuthState{
  final String uid;

  AuthSuccessState(this.uid);//or any DataModel object

}
class AuthFailureState extends AuthState{
  final String errorMessage;

  AuthFailureState({required this.errorMessage});
}

class AuthLoadingState extends AuthState{

}