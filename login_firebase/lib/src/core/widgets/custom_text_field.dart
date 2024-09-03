import 'package:flutter/material.dart';

import '../src/core/theme/palette.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;//To show dots in when form field is password

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
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
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(18),
            filled: true,
            fillColor: Palette.textFieldColor,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: hintText,
          ),
          obscureText: obscureText,
          validator: (value) {
            if(value == null || value.isEmpty){
              return "Field is Empty!";
            }
            return null;
          },
        ),
      ),
    );
  }
}
