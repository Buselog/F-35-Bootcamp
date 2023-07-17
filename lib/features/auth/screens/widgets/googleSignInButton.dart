import 'package:f35/features/auth/controller/auth_controller.dart';
import 'package:f35/features/auth/screens/constants/constants.dart';
import 'package:f35/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({super.key});

  void signInWithGoogle(WidgetRef ref) {
    ref.read(authControllerProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      icon: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: SvgPicture.asset(
          Constants.googleLogoPath,
          height: 20,
        ),
      ),
      onPressed: () => signInWithGoogle(ref),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        backgroundColor: Pallete.secondaryColor,
        foregroundColor: Pallete.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      label: const Text(
        'Google ile',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
