import 'package:faks/core/di.dart';
import 'package:faks/features/locations/domain/usecase/getAllLocationsUseCase.dart';
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
    final result = await _useCase();
    print("HERE");

    result.fold(
      (failure) => state = ErrorState(failure.message),
      (list) => state = list.isEmpty ? EmptyState() : FilledState(list),
    );
  }
}
