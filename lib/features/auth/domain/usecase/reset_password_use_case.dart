import 'package:dartz/dartz.dart';
import 'package:faks/core/error/failure.dart';
import 'package:faks/features/auth/domain/repository/user_repository.dart';

class ResetPasswordUseCase {
  final UserRepository _userRepository;

  ResetPasswordUseCase(this._userRepository);

  Future<Either<Failure, void>> call(String email) async {
    return _userRepository.resetPassword(email);
  }
}