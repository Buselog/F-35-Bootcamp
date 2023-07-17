import 'package:f35/home/screens/homepage.dart';
import 'package:f35/theme/pallete.dart';
import 'package:flutter/material.dart';

class AnonSignInButton extends StatelessWidget {
  final Function onTap;
  const AnonSignInButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Icon(Icons.person_rounded),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        backgroundColor: Pallete.helperColor1,
        foregroundColor: Pallete.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      label: const Text(
        'Anonim',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
