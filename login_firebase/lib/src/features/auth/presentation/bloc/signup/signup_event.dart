part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupRequestedEvent extends SignupEvent {
  final String userName;
  final String emailId;
  final String mobileNumber;
  final String password;
  final String rePassword;

  SignupRequestedEvent({
    required this.userName,
    required this.emailId,
    required this.mobileNumber,
    required this.password,
    required this.rePassword,
  });
}
