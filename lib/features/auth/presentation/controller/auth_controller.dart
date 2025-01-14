import 'package:faks/core/app_route.dart';
import 'package:faks/core/di.dart';
import 'package:faks/features/auth/domain/usecase/register_use_case.dart';
import 'package:faks/features/auth/domain/usecase/sign_in_use_case.dart';
import 'package:faks/features/auth/domain/usecase/sign_out_use_case.dart';
import 'package:faks/features/auth/presentation/controller/state/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends Notifier<AuthState> {
  late final SignInUseCase _signInUseCase;
  late final RegisterUseCase _registerUseCase;
  late final SignOutUseCase _signOutUseCase;

  late User? currentUser;

  @override
  AuthState build() {
    _signInUseCase = ref.watch(signInUseCaseProvider);
    _registerUseCase = ref.watch(registerUseCaseProvider);
    _signOutUseCase = ref.watch(signOutUseCaseProvider);
    return UnauthenticatedState();
  }

  void signIn(final String email, final String password) async {
    state = LoadingState();

    final result = await _signInUseCase(email, password);

    result.fold((failure) => state = UnauthenticatedState(failure: failure),
        (user) => state = AuthenticatedState(user!));
  }

  void register(final String email, final String password) async {
    state = LoadingState();

    final result = await _registerUseCase(email, password);

    result.fold((failure) => state = UnauthenticatedState(failure: failure),
        (user) => state = AuthenticatedState(user!));
  }

  Future<void> signOut(BuildContext context) async {
    final results = await _signOutUseCase();
    results.fold((error) {
      state = UnauthenticatedState(failure: error);
    }, (_) {
      state = UnauthenticatedState();
      currentUser = null;
      Navigator.of(context).pushNamed(AppRoute.signIn);
    });
  }
}