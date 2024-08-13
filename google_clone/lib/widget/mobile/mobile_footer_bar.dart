import 'package:flutter/material.dart';
import 'package:google_clone/widget/footer_text.dart';

class MobileFooterBar extends StatelessWidget {
  const MobileFooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      children: [
        FooterText(title: "About"),
        SizedBox(
          width: 10,
        ),
        FooterText(title: "Advertising"),
        SizedBox(
          width: 10,
        ),
        FooterText(title: "Business"),
        SizedBox(
          width: 10,
        ),
        FooterText(title: "How Search Works"),
        SizedBox(
          width: 10,
        ),
        FooterText(title: "Privacy"),
        SizedBox(
          width: 10,
        ),
        FooterText(title: "Terms"),
        SizedBox(
          width: 10,
        ),
        FooterText(title: "Settings"),
      ],
    );
  }
}
