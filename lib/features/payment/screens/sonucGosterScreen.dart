import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class sonucGoster extends StatelessWidget {
  const sonucGoster({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RiveAnimation.network(
          'https://public.rive.app/community/runtime-files/4207-8735-success.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
