import 'package:faks/core/di.dart';
import 'package:faks/features/auth/domain/usecase/register_use_case.dart';
import 'package:faks/features/auth/domain/usecase/sign_in_use_case.dart';
import 'package:faks/features/auth/presentation/controller/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends Notifier<AuthState> {
  late final SignInUseCase _signInUseCase;
  late final RegisterUseCase _registerUseCase;

  @override
  AuthState build() {
    _signInUseCase = ref.watch(signInUseCaseProvider);
    _registerUseCase = ref.watch(registerUseCaseProvider);
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
}
