import 'package:faks/core/di.dart';
import 'package:faks/features/locations/presentation/location_list/controller/state/location_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationListScreen extends ConsumerWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationListNotifier);

    return Column(
      children: [
        const Text('Places'),
        switch (state) {
          LoadingState() => const Expanded(child: Center(child: CircularProgressIndicator.adaptive())),
          EmptyState() => const Text('No places found'),
          ErrorState() => const Text('An error occurred'),
          FilledState(locations: var list) => Expanded(
            child: ListView.separated(
                itemCount: list.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) =>
                    Card(child: Text(list[index].title)),
              ),
          )
        }
      ],
    );
  }
}
