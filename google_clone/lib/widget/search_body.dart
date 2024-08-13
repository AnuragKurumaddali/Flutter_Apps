import 'package:flutter/material.dart';
import 'package:google_clone/widget/mobile/mobile_footer_bar.dart';
import 'package:google_clone/widget/search_box.dart';
import 'package:google_clone/widget/translation_text.dart';
import 'package:google_clone/widget/web/web_footer_bar.dart';
import 'package:google_clone/widget/web/search_button.dart';

class SearchBody extends StatelessWidget {
  final bool isMobileLayout;
  const SearchBody({super.key, required this.isMobileLayout});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        !isMobileLayout ? SizedBox(height: size.height * 0.25,):const Spacer(),
        Center(child: Image.asset("assets/images/google-logo.png",height: size.height*0.15,),),
        const SizedBox(height: 20,),
        const SearchBox(),
        const SizedBox(height: 20,),
        !isMobileLayout ? const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchButton(title: "Google Search"),
            SizedBox(width: 10,),
            SearchButton(title: "I'm Feeling Lucky"),
          ],
        ) : const SizedBox.shrink(),
        !isMobileLayout ? const SizedBox(height: 20,) : const SizedBox.shrink(),
        !isMobileLayout ? const TranslationText() : const SizedBox.shrink(),
        const Spacer(),
        size.width > 768 ? const WebFooterBar() : const MobileFooterBar(),
      ],
    );
  }
}
