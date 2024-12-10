import 'package:faks/core/di.dart';
import 'package:faks/core/style/style_extensions.dart';
import 'package:faks/features/locations/presentation/location_list/controller/state/location_list_state.dart';
import 'package:faks/features/locations/presentation/location_list/widget/empty_state_widget.dart';
import 'package:faks/features/locations/presentation/location_list/widget/error_state_widget.dart';
import 'package:faks/features/locations/presentation/location_list/widget/location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class LocationListScreen extends ConsumerWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationListNotifier);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Places', style: context.textTitle),
          const SizedBox(height: 15),
          switch (state) {
            LoadingState() => Expanded(
                  child: Center(
                child: Lottie.asset("assets/animations/loading_sights.json",
                    width: 100),
              )),
            EmptyState() => const Expanded(child: EmptyStateWidget()),
            ErrorState(failure: var failure) =>
              Expanded(child: ErrorStateWidget(failure: failure)),
            FilledState(locations: var list) => Expanded(
                child: ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) =>
                      LocationCard(list[index]),
                ),
              )
          }
        ],
      ),
    );
  }
}
