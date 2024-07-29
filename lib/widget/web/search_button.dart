import 'package:flutter/material.dart';
import 'package:google_clone/constants/colors.dart';

class SearchButton extends StatelessWidget {
  final String title;

  const SearchButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 18,
      ),
      color: searchColor,
      child: Text(title),
    );
  }
}
