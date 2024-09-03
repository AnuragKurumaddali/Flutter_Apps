import 'package:fpdart/src/either.dart';
import 'package:login_firebase/src/core/error/failure.dart';
import 'package:login_firebase/src/core/usecase/usecase.dart';
import 'package:login_firebase/src/features/auth/domain/entities/user_entity.dart';
import 'package:login_firebase/src/features/auth/domain/repository/signup_repository.dart';

class UserSignup implements UseCase<UserEntity, UserSignUpParams> {
  final SignupRepository _signupRepository;

  const UserSignup(this._signupRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserSignUpParams params) async {
    return await _signupRepository.signUpRepository(
      userName: params.userName,
      emailId: params.emailId,
      mobileNum: params.mobileNum,
      password: params.password,
      rePassword: params.rePassword,);
  }
}

class UserSignUpParams {
  final String userName;
  final String emailId;
  final String mobileNum;
  final String password;
  final String rePassword;

  UserSignUpParams({
    required this.userName,
    required this.emailId,
    required this.mobileNum,
    required this.password,
    required this.rePassword,
  });
}
