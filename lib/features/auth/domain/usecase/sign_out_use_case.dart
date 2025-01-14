import 'package:dartz/dartz.dart';
import 'package:faks/core/error/failure.dart';
import 'package:faks/features/auth/domain/repository/user_repository.dart';

class SignOutUseCase {
  final UserRepository _userRepository;

  SignOutUseCase(this._userRepository);

  Future<Either<Failure, void>> call() async {
    return _userRepository.signOut();
  }
}