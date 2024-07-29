import 'package:flutter/material.dart';
import 'package:google_clone/constants/colors.dart';
import 'package:google_clone/widget/footer_text.dart';

class WebFooterBar extends StatelessWidget {
  const WebFooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
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
            Spacer(),
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
        ),
      ),
    );
  }
}
