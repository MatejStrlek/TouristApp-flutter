import 'package:faks/core/di.dart';
import 'package:faks/core/style/style_extensions.dart';
import 'package:faks/features/locations/domain/model/location.dart';
import 'package:faks/features/locations/presentation/location_detail/widget/circular_icon_button.dart';
import 'package:faks/features/locations/presentation/location_detail/widget/details_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationDetailScreen extends HookConsumerWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final location = ModalRoute.of(context)?.settings.arguments as Location;
    final isFavorite = useState(location.isFavorite);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Hero(
              tag: "location_image${location.id}",
              child: Image.network(
                location.imageUrl,
                height: screenSize.height / 2.5,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: context.colorBackground,
                  child: IconButton(
                    color: context.colorGradientEnd,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.chevron_left_rounded, size: 35),
                  ),
                ),
              ),
            ),
            DetailsSheet(location: location),
            Positioned(
              top: screenSize.height / 2.9,
              right: 40,
              child: CircularIconButton(
                icon: isFavorite.value ? Icons.favorite : Icons.favorite_outline,
                onPressed: () {
                  isFavorite.value ?
                    ref.read(favoriteListNotifier.notifier).removeAsFavorite(location) :
                    ref.read(favoriteListNotifier.notifier).setAsFavorite(location);
                  isFavorite.value = !isFavorite.value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
