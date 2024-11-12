import 'package:faks/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

sealed class AuthState {}

class AuthenticatedState extends AuthState {
  final User user;

  AuthenticatedState(this.user);
}

class LoadingState extends AuthState {}

class UnauthenticatedState extends AuthState {
  final Failure? failure;

  UnauthenticatedState({this.failure});
}
