import 'package:flutter/material.dart';

import '../src/core/theme/palette.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final Color borderColor;
  final Color checkColor;
  final Color backgroundColor;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 20,
    this.borderColor = Palette.blueColor,
    this.checkColor = Palette.blueColor,
    this.backgroundColor = Palette.transparentColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: value ? checkColor : backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: size - 4,
                color: Colors.white, // Color of the check mark
              )
            : null,
      ),
    );
  }
}
