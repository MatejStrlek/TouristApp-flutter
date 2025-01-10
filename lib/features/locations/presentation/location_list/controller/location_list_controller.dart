import 'package:faks/core/di.dart';
import 'package:faks/features/locations/domain/usecase/get_all_locations_use_case.dart';
import 'package:faks/features/locations/presentation/location_list/controller/state/location_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationListController extends Notifier<LocationListState> {
  late final GetAllLocationsUseCase _useCase;

  @override
  build() {
    _useCase = ref.watch(getAllLocationsUseCaseProvider);
    getAllLocations();
    return LoadingState();
  }

  void getAllLocations() async {
    state = LoadingState();
    await Future.delayed(const Duration(milliseconds: 1500));

    final result = await _useCase();
    result.fold(
      (failure) => state = ErrorState(failure),
      (list) => state = list.isEmpty ? EmptyState() : FilledState(list),
    );
  }
}
