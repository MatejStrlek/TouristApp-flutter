import 'package:dio/dio.dart';
import 'package:faks/features/auth/data/repository/user_repository.dart';
import 'package:faks/features/auth/domain/repository/user_repository.dart';
import 'package:faks/features/auth/domain/usecase/deactivate_use_case.dart';
import 'package:faks/features/auth/domain/usecase/register_use_case.dart';
import 'package:faks/features/auth/domain/usecase/resend_verify_email_case.dart';
import 'package:faks/features/auth/domain/usecase/reset_password_use_case.dart';
import 'package:faks/features/auth/domain/usecase/sign_in_use_case.dart';
import 'package:faks/features/auth/domain/usecase/sign_out_use_case.dart';
import 'package:faks/features/auth/presentation/controller/auth_controller.dart';
import 'package:faks/features/auth/presentation/controller/state/auth_state.dart';
import 'package:faks/features/locations/data/api/location_api.dart';
import 'package:faks/features/locations/data/database/database_manager.dart';
import 'package:faks/features/locations/data/repository/location_repository_impl.dart';
import 'package:faks/features/locations/domain/repository/location_repository.dart';
import 'package:faks/features/locations/domain/usecase/get_all_favorite_locations_use_case.dart';
import 'package:faks/features/locations/domain/usecase/get_all_locations_use_case.dart';
import 'package:faks/features/locations/presentation/favorite_list/controller/favorite_list_controller.dart';
import 'package:faks/features/locations/presentation/favorite_list/controller/state/favorite_list_state.dart';
import 'package:faks/features/locations/presentation/location_list/controller/location_list_controller.dart';
import 'package:faks/features/locations/presentation/location_list/controller/state/location_list_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:faks/features/auth/data/api/user_api.dart';

import '../features/locations/data/database/hive_manager.dart';
import '../features/locations/domain/usecase/remove_location_as_favorite_use_case.dart';
import '../features/locations/domain/usecase/set_location_as_favorite_use_case.dart';

//********** DATASOURCE **********//
final userApiProvider =
    Provider<UserApi>((ref) => UserApi(FirebaseAuth.instance));

final locationApiProvider = Provider<LocationApi>((ref) => LocationApi(Dio()));

final hiveManagerProvider = Provider<DatabaseManager>((ref) => HiveManager());

//********** Repository **********//
final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepositoryImpl(ref.watch(userApiProvider)));

final locationRepositoryProvider =
    Provider<LocationRepository>((ref) => LocationRepositoryImpl(
          ref.watch(locationApiProvider),
          ref.watch(hiveManagerProvider),
        ));

//********** UseCase **********//
final signInUseCaseProvider = Provider<SignInUseCase>(
    (ref) => SignInUseCase(ref.watch(userRepositoryProvider)));
final registerUseCaseProvider = Provider<RegisterUseCase>(
    (ref) => RegisterUseCase(ref.watch(userRepositoryProvider)));
final signOutUseCaseProvider = Provider<SignOutUseCase>(
    (ref) => SignOutUseCase(ref.watch(userRepositoryProvider)));
final deactivateUseCaseProvider = Provider<DeactivateUseCase>(
    (ref) => DeactivateUseCase(ref.watch(userRepositoryProvider)));
final resendVerifyEmailCaseProvider = Provider<ResendVerifyEmailCase>(
    (ref) => ResendVerifyEmailCase(ref.watch(userRepositoryProvider)));
final resetPasswordUseCaseProvider = Provider<ResetPasswordUseCase>(
    (ref) => ResetPasswordUseCase(ref.watch(userRepositoryProvider)));

final getAllLocationsUseCaseProvider = Provider<GetAllLocationsUseCase>(
    (ref) => GetAllLocationsUseCase(ref.watch(locationRepositoryProvider)));

final getAllFavoriteLocationsUseCaseProvider =
    Provider<GetAllFavoriteLocationsUseCase>((ref) =>
        GetAllFavoriteLocationsUseCase(ref.watch(locationRepositoryProvider)));

final setLocationAsFavoriteUseCaseProvider =
    Provider<SetLocationAsFavoriteUseCase>((ref) =>
        SetLocationAsFavoriteUseCase(ref.watch(locationRepositoryProvider)));

final removeLocationAsFavoriteUseCaseProvider =
    Provider<RemoveLocationAsFavoriteUseCase>((ref) =>
        RemoveLocationAsFavoriteUseCase(ref.watch(locationRepositoryProvider)));

//********** Notifier **********//
final authNotifier =
    NotifierProvider<AuthController, AuthState>(() => AuthController());
final locationListNotifier =
    NotifierProvider<LocationListController, LocationListState>(
  () => LocationListController(),
);

final favoriteListNotifier =
    NotifierProvider<FavoriteListController, FavoriteListState>(
  () => FavoriteListController(),
);