import 'package:dartz/dartz.dart';
import 'package:faks/core/error/failure.dart';
import 'package:faks/features/auth/data/api/user_api.dart';
import 'package:faks/features/auth/domain/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;

  UserRepositoryImpl(this._userApi);

  @override
  Future<Either<Failure, User?>> signIn(String email, String password) async {
    try {
      final user = await _userApi.signIn(email, password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(FirebaseAuthFailure("User not found"));
      } else if (e.code == 'wrong-password') {
        return Left(FirebaseAuthFailure("Wrong password"));
      } else {
        return Left(FirebaseAuthFailure("Firebase error occurred"));
      }
    } catch (e) {
      return Left(NetworkFailure("Network error occurred"));
    }
  }

  @override
  Future<Either<Failure, User?>> register(String email, String password) async {
    try {
      final user = await _userApi.register(email, password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(FirebaseAuthFailure("Email already in use"));
      } else {
        return Left(FirebaseAuthFailure("Firebase error occurred"));
      }
    } catch (e) {
      return Left(NetworkFailure("Network error occurred"));
    }
  }
}
