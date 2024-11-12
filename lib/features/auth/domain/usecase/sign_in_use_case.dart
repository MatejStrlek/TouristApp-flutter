import 'package:dartz/dartz.dart';
import 'package:faks/core/error/failure.dart';
import 'package:faks/features/auth/domain/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase {
  final UserRepository _userRepository;

  SignInUseCase(this._userRepository);

  Future<Either<Failure, User?>> call(
      final String email, final String password) async {
    return _userRepository.signIn(email, password);
  }
}
