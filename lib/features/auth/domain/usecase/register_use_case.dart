import 'package:dartz/dartz.dart';
import 'package:faks/core/error/failure.dart';
import 'package:faks/features/auth/domain/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUseCase {
  final UserRepository _userRepository;

  RegisterUseCase(this._userRepository);

  Future<Either<Failure, User?>> call(
      final String email, final String password) async {
    return _userRepository.register(email, password);
  }
}