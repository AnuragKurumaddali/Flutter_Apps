import 'package:flutter/material.dart';
import 'package:login_firebase/src/core/theme/palette.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textTitle;
  const CustomButton({super.key, required this.textTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.blueColor,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color with opacity
            offset: const Offset(0, 4), // Horizontal and vertical offset
            blurRadius: 4, // Blur radius
            spreadRadius: 1, // Spread radius
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          textTitle,
          style: const TextStyle(
            color: Palette.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
