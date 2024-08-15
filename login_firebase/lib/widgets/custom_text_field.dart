import 'package:flutter/material.dart';

import '../constants/palette.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
              offset: const Offset(0, 4), // Horizontal and vertical offset
              blurRadius: 6, // Blur radius
              spreadRadius: 0, // Spread radius
            ),
          ],
          borderRadius: BorderRadius.circular(10), // Match the border radius
        ),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(18),
            filled: true,
            fillColor: Palette.textFieldColor,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
