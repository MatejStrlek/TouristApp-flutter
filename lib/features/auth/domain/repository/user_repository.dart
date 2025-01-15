import 'package:dartz/dartz.dart';
import 'package:faks/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User?>> signIn(
      final String email, final String password);
  Future<Either<Failure, User?>> register(
      final String email, final String password);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> deactivate();
  Future<Either<Failure, void>> resetPassword(final String email);
  Future<Either<Failure, void>> resendVerifyEmail();
}
