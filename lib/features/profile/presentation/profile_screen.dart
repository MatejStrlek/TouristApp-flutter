import 'package:faks/core/di.dart';
import 'package:faks/core/style/style_extensions.dart';
import 'package:faks/features/auth/presentation/widget/custom_primary_button.dart';
import 'package:faks/features/auth/presentation/widget/custom_secondary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Profile', style: context.textTitle), // TODO: Move text to start of the screen
                Column(
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(
                        user?.photoURL != null && user!.photoURL!.isNotEmpty
                            ? user.photoURL!
                            : "https://www.pngitem.com/pimgs/m/24-248366_profile-clipart-generic-user-generic-profile-picture-gender.png",
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                        (user?.displayName != null &&
                                user!.displayName!.isNotEmpty)
                            ? user.displayName!
                            : 'No name',
                        style: context.textTitle),
                    const SizedBox(height: 10),
                    Text(
                      (user?.email != null && user!.email!.isNotEmpty)
                          ? user.email!
                          : 'No email',
                      style: context.textSubtitle.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomSecondaryButton(
                        child: const Text("Deactivate"),
                        onPressed: () {
                          ref.read(authNotifier.notifier).deactivate(context);
                        }),
                    const SizedBox(height: 20),
                    CustomPrimaryButton(
                      child: const Text("Sign out"),
                      onPressed: () {
                        ref.read(authNotifier.notifier).signOut(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
