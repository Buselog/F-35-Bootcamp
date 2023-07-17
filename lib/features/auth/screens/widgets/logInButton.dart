import 'package:f35/theme/pallete.dart';
import 'package:flutter/material.dart';

class LogInButton extends StatelessWidget {
  final Function onTap;

  const LogInButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        backgroundColor: Pallete.primaryColor,
        foregroundColor: Pallete.whiteColor,
        minimumSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: const Text(
        'GİRİŞ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          letterSpacing: 5,
        ),
      ),
    );
  }
}
