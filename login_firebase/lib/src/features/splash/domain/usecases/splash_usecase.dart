import 'package:fpdart/src/either.dart';
import 'package:login_firebase/src/core/error/failure.dart';
import 'package:login_firebase/src/core/usecase/usecase.dart';
import 'package:login_firebase/src/features/splash/domain/repository/splash_repository.dart';

class SpalshUsecase implements UseCase<bool,void>{
  final SplashRepository _splashRepository;

  SpalshUsecase(this._splashRepository);
  @override
  Future<Either<Failure, bool>> call(void params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}